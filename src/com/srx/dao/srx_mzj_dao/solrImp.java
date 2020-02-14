package com.srx.dao.srx_mzj_dao;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.solr.client.solrj.SolrQuery;
import org.apache.solr.client.solrj.SolrServer;
import org.apache.solr.client.solrj.impl.HttpSolrServer;
import org.apache.solr.client.solrj.response.QueryResponse;
import org.apache.solr.common.SolrDocument;
import org.apache.solr.common.SolrDocumentList;
import org.springframework.stereotype.Repository;

import com.srx.model.srx_fyl_model.video;
import com.srx.model.srx_mzj_model.Video;

@Repository
public class solrImp implements solr{

	// 索引库 xml配置错误 空指针
		/*@Autowired
		private SolrServer solrServer;*/
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
	Date date=null;
	
	//创建连接
	SolrServer solrServer = new HttpSolrServer("http://43.231.185.233:8081/solr/collection1");
	
	@Override
	public List<video> solrSelVideo(String vtitle) throws Exception {
		List<video> sorlvideo = new ArrayList<video>();
		
		if(vtitle.equals("") || vtitle.equals(null)){
			System.out.println("关键字为空");
			return sorlvideo;
		}else{
			SolrQuery solrQuery = new SolrQuery();
			solrQuery.setQuery("vtitle:"+vtitle);
			
			// 执行查询
			QueryResponse response = solrServer.query(solrQuery);
			// 文档结果集
			SolrDocumentList docs = response.getResults();
			
			for (SolrDocument solrDocument : docs) {
				video v=new video();
				v.setVid(Integer.parseInt(solrDocument.get("id").toString()));
				v.setVtitle(solrDocument.get("vtitle").toString());
				v.setVdate(solrDocument.get("vdate").toString());
				v.setVclicks(Integer.parseInt(solrDocument.get("vclicks").toString()));
				v.setVurl(solrDocument.get("vurl").toString());
				v.setVpicture(solrDocument.get("vpicture").toString());
				v.setIid(Integer.parseInt(solrDocument.get("iid").toString()));
				v.setIname(solrDocument.get("iname").toString());
				sorlvideo.add(v);
			}
			return sorlvideo;
		}
	}

}
