				/*请求服务器地址*/
	//var srx_url="http://www.cytxjd.top/Home_of_talent_and_skills/";
	/*请求本地地址*/
	//var srx_url="http://192.168.199.233:8080/Home_of_talent_and_skills/";
	var srx_url="http://www.cytxjd.top/Home_of_talent_and_skills/";
angular.module('ionicApp', ['ionic']).controller('AppCtrl', ['$scope', '$timeout', '$http', function ($scope, $timeout, $http, $ionicLoading) {
    $scope.SearchCompletedPage = true;//搜索结果
    $scope.SearchRecommended = true;//模糊查询搜索
    $scope.RecommendSearchRecord = false;//搜索记录
    var OVD;
    try {
        OVD = new OlderVersionData_2019_12_5;
    } catch (e) {
    }
	//传值给视频播放页面
	$scope.get_video=function(){
	/* alert(arguments[0],arguments[1],arguments[2]); */
	$http.get(srx_url+"video.do",{params:{iid:arguments[0],vurl:arguments[1],vid:arguments[2]}}).success(function(e){
										
		console.log(e);
										
	})
		location.href="video_is_recommended.html";
	}
    //点击按钮触发方法
    $scope.HistoryClick = function (event) {
        // console.log(event.toElement.value)
        $scope.SearchCompletedPage = false;//搜索结果
        $scope.SearchRecommended = true;//模糊查询搜索
        $scope.RecommendSearchRecord = true;//搜索记录
        $http({
            method: 'POST',
            url: srx_url+'V_LikeVtitle.do',
            params: {vtitle: event.toElement.value},
            cache: true,
        }).then(function successCallback(response) {
            $scope.SearchVal = event.toElement.value;
            OVD.add()
            if (response.data.length > 0) {
                $scope.TVideo = response.data;
                $scope.SearchResult = false;
                $scope.SearchResultNull = true;
            } else if (this.item.vtitle.length == 0) {
                $scope.TVideo = '没有数据';
                $scope.SearchResult = true;
                $scope.SearchResultNull = false;
            } else {
                $scope.SearchResult = true;
                $scope.SearchResultNull = false;
            }
        }, function errorCallback(response) {
            alert('请求数据失败' + response)
        });
    }
    //点击模糊查询事件
    $scope.SearchResultF = function () {
        var val = this.item.vtitle
        console.log(val)
        $scope.SearchCompletedPage = false;//搜索结果
        $scope.SearchRecommended = true;//模糊查询搜索
        $scope.RecommendSearchRecord = true;//搜索记录
        $http({
            method: 'POST',
            url: srx_url+'V_LikeVtitle.do',
            params: {vtitle: val},
            cache: true,
        }).then(function successCallback(response) {
            $scope.SearchVal = response.data;
            OVD.add(val)
            if (response.data.length > 0) {
                $scope.TVideo = response.data;
                $scope.SearchVal = val;
                $scope.SearchResult = false;
                $scope.SearchResultNull = true;
            } else if (this.item.vtitle.length == 0) {
                $scope.TVideo = '没有数据';
                $scope.SearchResult = true;
                $scope.SearchResultNull = false;
            } else {
                $scope.SearchResult = true;
                $scope.SearchResultNull = false;
            }
        }, function errorCallback(response) {
            alert('请求数据失败' + response)
        });
    }
    //点击搜索方法
    $scope.SearchClick = function () {
        // console.log($scope.SearchVal)
        if ('没有数据' != $scope.SearchVal && !$.trim($scope.SearchVal) && null != $.trim($scope.SearchVal) && undefined != $.trim($scope.SearchVal)) {
            $scope.SearchCompletedPage = false;//搜索结果
            $scope.SearchRecommended = true;//模糊查询搜索
            $scope.RecommendSearchRecord = true;//搜索记录
            $http({
                method: 'POST',
                url: srx_url+'V_LikeVtitle.do',
                params: {vtitle: $.trim($scope.SearchVal)},
                cache: true,
            }).then(function successCallback(response) {
                // $cookies.put('Vtitle' + this.item.vtitle, value[$scope.SearchVal]);
                // // console.log('开局查询', response.data)
                if (!$.trim($scope.SearchVal) > 0) {
                    OVD.add($scope.SearchVal)
                    // // console.log('数据大于1', response.data)
                    $scope.SearchResult = false;
                    $scope.SearchResultNull = true;
                    $scope.TVideo = response.data;
                } else {
                    $scope.SearchResult = true;
                    $scope.SearchResultNull = false;
                }
            }, function errorCallback(response) {
                alert('请求数据失败' + response)
                $scope.SearchCompletedPage = true;//搜索结果
                $scope.SearchRecommended = true;//模糊查询搜索
                $scope.RecommendSearchRecord = false;//搜索记录
                $scope.SearchResult = true;
                $scope.SearchResultNull = false;
            });
        } else {
            $scope.SearchCompletedPage = false;//搜索结果
            $scope.SearchRecommended = true;//模糊查询搜索
            $scope.RecommendSearchRecord = true;//搜索记录
        }
    }
    $scope.SearchC = function () {
        // console.log($scope.SearchVal)
        console.log($scope.SearchVal)
        console.log('值是:', $.trim($scope.SearchVal).length)
        $scope.SearchCompletedPage = true;//搜索结果
        $scope.SearchRecommended = false;//模糊查询搜索
        $scope.RecommendSearchRecord = true;//搜索记录
        $http({
            method: 'POST',
            url: srx_url+'V_LikeVtitle.do',
            params: {vtitle: $scope.SearchVal},
            cache: true,
        }).then(function successCallback(response) {
            // // console.log('开局查询', response.data)
            if (response.data.length == 0) {
                // console.log('$scope.SearchVal.length', response.data)

                $scope.SearchResult = true;
                $scope.SearchResultNull = false;
                $scope.TVideo = '没有数据';
            } else if (response.data.length > 0) {
                console.log('数据大于1', response.data)
                $scope.TVideo = response.data;
                $scope.SearchResult = false;
                $scope.SearchResultNull = true;
            } else {
                console.log('else', response.data)
            }
        }, function errorCallback(response) {
            alert('请求数据失败' + response)
        });
    }


    //聚焦事件 获得焦点
    // $scope.SearchF = function () {
    //     $scope.SearchCompletedPage = true;//搜索结果
    //     $scope.SearchRecommended = false;//模糊查询搜索
    //     $scope.RecommendSearchRecord = true;//搜索记录
    //
    //     //丢失焦点事件
    //     // $scope.SearchB = function () {
    //     //
    //     //     setTimeout(function () {
    //     //         $scope.SearchCompletedPage = true;//搜索结果
    //     //         $scope.SearchRecommended = true;//模糊查询搜索
    //     //         $scope.RecommendSearchRecord = false;//搜索记录
    //     //     }, 50)
    //     //
    //     // }
    // }
}]);

function OlderVersionData_2019_12_5() {
    this.add = function () {
        if (arguments[0] != "" || arguments[0] != undefined) {
            $('.Search-history').append('<input type="button" class="bottom" value="' + arguments[0] + '" ng-click="HistoryClick($event)"/>');
        }
    }
    /**
     * 不知道该方法的用意
     */
    //this.add = function b() {
    //     var txt = document.getElementById("text");
    //     /* var body_txt1 = document.getElementsByName("body_txt1").value; */
    //     var body_txt2 = document.getElementsByName("body_txt1");
    //     for (var i = 0; i < body_txt2.length; i++) {
    //         body_txt2[i].onclick = function () {
    //             txt.value = this.value;
    //         }
    //     }
    // }

    this.del = function del() {
        $('.Search-history').html(' ')
    }
}
