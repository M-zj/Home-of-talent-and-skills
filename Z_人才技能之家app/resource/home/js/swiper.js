    angular.module('ionicApp', ['ionic'])
        .controller('MyCtrl',['$scope','$timeout' ,'$http',function($scope,$timeout,$http) {
            $scope.doRefresh = function() {
                $http.get('')   //注意改为自己本站的地址，不然会有跨域问题
                    .success(function(newItems) {
                        $scope.items = newItems;
                    })
                    .finally(function() {
                        $scope.$broadcast('scroll.refreshComplete');
                    });
            };
        }]);  
var swiper = new Swiper('.swiper-container-message', {
      slidesPerView: 2,
      paginationClickable: true,
      spaceBetween: 30,
      freeMode: true
  });