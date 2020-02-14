package com.srx.dao.srx_mzj_dao;
import org.apache.solr.client.solrj.SolrQuery;
import org.apache.solr.client.solrj.SolrServer;
import org.apache.solr.client.solrj.impl.HttpSolrServer;
import org.apache.solr.client.solrj.response.QueryResponse;
import org.apache.solr.common.SolrDocument;
import org.apache.solr.common.SolrDocumentList;
import org.springframework.stereotype.Repository;

@Repository
public class solrcon{//测试类
	public void queryIndex(String vtitle) throws Exception {
		//创建连接
		SolrServer solrServer = new HttpSolrServer("http://43.231.185.233:8081/solr/collection1");
		//创建一个query对象
		SolrQuery query = new SolrQuery();
		//设置查询条件
		query.setQuery("vtitle:"+vtitle);
		System.out.println("vtitle:"+vtitle);
		//执行查询
		QueryResponse queryResponse = solrServer.query(query);
		//取查询结果
		SolrDocumentList solrDocumentList = queryResponse.getResults();
		//共查询到商品数量
		System.out.println("共查询到商品数量:" + solrDocumentList.getNumFound());
		//遍历查询的结果
		for (SolrDocument solrDocument : solrDocumentList) {
			System.out.println(solrDocument.get("id"));
			System.out.println(solrDocument.get("vtitle"));
			System.out.println(solrDocument.get("vdate"));
			System.out.println(solrDocument.get("vclicks"));
			System.out.println(solrDocument.get("vurl"));
			System.out.println(solrDocument.get("vpicture"));
			System.out.println(solrDocument.get("iid"));
			
			
		}
	}
	public static void main(String[] args) throws Exception {
		System.out.println("+++++——————————————————开始");
		/*solrcon s=new solrcon();
		s.queryIndex("桥边");*/
		solrImp si=new solrImp();
		si.solrSelVideo("高级");
		
		System.out.println("+++++——————————————————结尾");
	}
}
