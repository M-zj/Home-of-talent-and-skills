package com.srx.service.srx_ck_service;

import org.springframework.stereotype.Service;

import com.srx.dao.srx_mzj_dao.VideoMapper;
import com.srx.dao.srx_mzj_dao.solr;
import com.srx.dao.srx_mzj_dao.solrImp;
import com.srx.model.srx_mzj_model.Video;

import javax.annotation.Resource;
import java.util.List;

@Service("CkVideoService")
public class VideoService {
    /*ck搜索*/
    
    @Resource
    private VideoMapper vm;
    
    public int deleteByPrimaryKey(Integer vid) {
        return vm.deleteByPrimaryKey ( vid );
    }

    public int insert(Video record) {
        return vm.insert ( record );
    }

    public Video selectByPrimaryKey(Integer vid) {
        return vm.selectByPrimaryKey ( vid );
    }

    public List<Video> selectAll() {
        return vm.selectAll ();
    }

    public int updateByPrimaryKey(Video record) {
        return vm.updateByPrimaryKey ( record );
    }

    public List<Video> selectLikeVtitle(String vtitle) {
        return vm.selectLikeVtitle ( vtitle );
    }
}
