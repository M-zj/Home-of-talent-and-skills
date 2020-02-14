package com.srx.dao.srx_mzj_dao;

import java.util.List;

import com.srx.model.srx_fyl_model.video;
import com.srx.model.srx_mzj_model.Video;

public interface solr {
	public List<video> solrSelVideo(String vtitle) throws Exception;
}
