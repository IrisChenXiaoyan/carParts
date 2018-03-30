<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<%@ page import="java.awt.*,org.jfree.chart.plot.*,org.jfree.ui.TextAnchor,org.jfree.chart.labels.*,java.sql.*,bean.DBBean,org.jfree.chart.ChartFactory,org.jfree.chart.JFreeChart,org.jfree.chart.plot.PlotOrientation,
org.jfree.chart.servlet.ServletUtilities,org.jfree.data.category.DefaultCategoryDataset,org.jfree.data.category.CategoryDataset,org.jfree.chart.renderer.category.BarRenderer3D"%>  
    
<!DOCTYPE html>
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=GBK">
	<title>����ͳ��</title>
	<link type="text/css" href="style.css" rel="stylesheet">
	</head>
	<body>
		<jsp:useBean id="db" class="bean.DBBean" scope="page"/>
	<%
	

	DefaultCategoryDataset dataset = new DefaultCategoryDataset();

	String sql="select * from partsinfo";
	ResultSet rs=db.executeQuery(sql);
	 while (rs.next()) {
		 dataset.addValue(rs.getInt(3), "", rs.getString(2));
     }
     rs.close();
     JFreeChart chart = ChartFactory.createBarChart3D("�������������ͳ��","�����","����",dataset,PlotOrientation.VERTICAL,false,false,false);
     //��ʾÿ�����ӵ���ֵ
     CategoryPlot plot=chart.getCategoryPlot();
     
     BarRenderer3D renderer=new BarRenderer3D();
     renderer.setBaseItemLabelGenerator(new StandardCategoryItemLabelGenerator());
     renderer.setBaseItemLabelsVisible(true);
   	 plot.setRenderer(renderer);
   	 
   	 
     String fileName = ServletUtilities.saveChartAsPNG(chart,800,400,session); 
    //ServletUtilities������web�����Ĺ����࣬����һ���ַ����ļ���,�ļ����Զ����ɣ����ɺõ�ͼƬ���Զ����ڷ�������tomcat������ʱ�ļ��£�temp��
    
     String url = request.getContextPath() + "/chart/DisplayChart?filename=" + fileName;
    //�����ļ���ȥ��ʱĿ¼��Ѱ�Ҹ�ͼƬ�������/DisplayChart·��Ҫ�������ļ����û��Զ����<url-pattern>һ��

	%>

	<img src="<%= url %>" width="800px" height="400px" style="margin-top:2em;display:block;margin-left:auto;margin-right:auto">
	<br>
	<p style="margin-left:auto;margin-right:auto;width:7em"><a href="manager.html">������ҳ��</a></p>
	</body>
</html>