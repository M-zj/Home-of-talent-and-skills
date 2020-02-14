package com.srx.service.srx_mzj_service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.srx.dao.srx_mzj_dao.VideoMapper;
import com.srx.model.srx_mzj_model.Video;


@Service("wylService")
public class wylService {
	@Resource
	private VideoMapper vm;
	
	/*wyl添加视频*/
    public int insert(Video record) {
        return vm.insert (record);
    }
}
