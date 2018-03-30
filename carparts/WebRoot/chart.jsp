<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<%@ page import="java.awt.*,org.jfree.chart.plot.*,org.jfree.ui.TextAnchor,org.jfree.chart.labels.*,java.sql.*,bean.DBBean,org.jfree.chart.ChartFactory,org.jfree.chart.JFreeChart,org.jfree.chart.plot.PlotOrientation,
org.jfree.chart.servlet.ServletUtilities,org.jfree.data.category.DefaultCategoryDataset,org.jfree.data.category.CategoryDataset,org.jfree.chart.renderer.category.BarRenderer3D"%>  
    
<!DOCTYPE html>
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=GBK">
	<title>物资统计</title>
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
     JFreeChart chart = ChartFactory.createBarChart3D("汽车零配件数量统计","零配件","数量",dataset,PlotOrientation.VERTICAL,false,false,false);
     //显示每个柱子的数值
     CategoryPlot plot=chart.getCategoryPlot();
     
     BarRenderer3D renderer=new BarRenderer3D();
     renderer.setBaseItemLabelGenerator(new StandardCategoryItemLabelGenerator());
     renderer.setBaseItemLabelsVisible(true);
   	 plot.setRenderer(renderer);
   	 
   	 
     String fileName = ServletUtilities.saveChartAsPNG(chart,800,400,session); 
    //ServletUtilities是面向web开发的工具类，返回一个字符串文件名,文件名自动生成，生成好的图片会自动放在服务器（tomcat）的临时文件下（temp）
    
     String url = request.getContextPath() + "/chart/DisplayChart?filename=" + fileName;
    //根据文件名去临时目录下寻找该图片，这里的/DisplayChart路径要与配置文件里用户自定义的<url-pattern>一致

	%>

	<img src="<%= url %>" width="800px" height="400px" style="margin-top:2em;display:block;margin-left:auto;margin-right:auto">
	<br>
	<p style="margin-left:auto;margin-right:auto;width:7em"><a href="manager.html">返回主页面</a></p>
	</body>
</html>