<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/top/top.jsp"%>

<style type="text/css">
.myoverflow {
	overflow: hidden;
	text-overflow: ellipsis;
}
#text4	{
		position: absolute;
		top: 15px;
		left: 150px;
		width: 1150px;
	}
#text5	{
		position: absolute;
		top: 450px;
		left: 150px;
		width: 1150px;
	}
</style>
<script type="text/javascript">
	function GameList(type, round, league) {
		var url = "/toto/buygame/targetGame.to?type=" + type + "&round="
				+ round + "&league=" + league;
		window
				.open(
						url,
						"GameList",
						"toolbar=no, location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=350, height=430");

	}
</script>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">


<!-- Custom CSS -->
<link href="/toto/top/css/modern-business.css" rel="stylesheet">

<div >

	<!-- Header Carousel -->

	<header id="myCarousel" class="carousel slide"> <!-- Indicators -->
	<ol class="carousel-indicators">

	</ol>

	<!-- Wrapper for slides -->
	<div id="text4">
	<div class="carousel-inner">
		<div class="item active">
			<div class="fill">
				</br>

				<table align="center" border="0">
					<tr>
						<td>&nbsp;&nbsp;&nbsp;<img border="0"
							src="/toto/top/img/toto.png">
						</td>
					</tr>
				</table>
			</div>

		</div>
	</div>
	</div>
	<!-- Controls --> <a class="left carousel-control" data-slide="prev">
	</a> <a class="right carousel-control" data-slide="next"> </a> </header>



	<!-- Page Content -->
	<div id="text5" class="container">

		<!-- Marketing Icons Section -->
		<div class="row">
			<div class="col-lg-12">
				<img border="0" src="/toto/top/img/doto.png">
			</div>

			<div class="col-lg-12">
				<h2 class="page-header">���� ����</h2>

			</div>
			<div>
				<div style="margin-left:-35%" >
					<table width=45% border=1 align="center">
              <tr bgcolor="#E7E7E7">
              <td align="center">����</td>
              <td align="center">����</td>
              <td align="center">���Ӹ�</td>
              <td align="center">�߸�����</td>
              <td colspan="2" align="center">����</td>
              </tr>
						<c:if test="${empty gameslist}">
	<tr><td colspan="6" align="center">�˻��� ��Ⱑ �����ϴ�.</td></tr>
	</c:if>
	<c:if test="${not empty gameslist}">
	<c:forEach items="${gameslist}" var="gameslist">
	<tr>
		<td align="center">${gameslist.game }</td>
		<c:if test="${gameslist.league != null  }">
		<td align="center">${gameslist.league }</td>
		</c:if>
		<c:if test="${gameslist.league == null  }">
		<td align="center">��ü</td>
		</c:if>
		<td align="center">${gameslist.type } ${gameslist.round }ȸ�� &nbsp;
		<img border="0" src="/toto/images/gameview.gif" onclick="GameList('${gameslist.type}','${gameslist.round}','${gameslist.league}')"/></td>
		<td align="center"><fmt:formatDate value="${gameslist.start_date}" pattern="yy-MM-dd HH:mm"/> ~
		<fmt:formatDate value="${gameslist.end_date}" pattern="yy-MM-dd HH:mm"/>
		</td>
		<c:if test="${gameslist.flag != '�߸���'}">
		<td colspan="2" align="center">${gameslist.flag }</td>
		</c:if>
		<c:if test="${gameslist.flag == '�߸���'}">
		<td width="80" align="center">${gameslist.flag }</td>
		<td width="90" align="center"><a href="/toto/proto/gameBuy.to?type=${gameslist.type }&round=${gameslist.round}&league=${gameslist.league}"><img border="0" src="/toto/images/buygame.gif"/></a></td>
		</c:if>
	</tr>
	</c:forEach>
	</c:if>
					</table>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<div style= "margin-left: 75%; width: 25%" class="col-md-4">

						<div style="margin-top: -75%" class="panel panel-default">
							<div class="panel-heading">
								<h4>
									<i class="fa fa-fw fa-compass"></i> <a style="font-size: 9pt;"
										href="/toto/top/main.to?local=Notice">��������</a>��
									<c:if test="${local=='Notice'}">
										<a style="float: right"
											href="/toto/board1/list.to?local=Notice"><img
											src="/toto/top/img/more.JPG"></a>
									</c:if>
									<c:if test="${local=='free'}">
										<a style="float: right" href="/toto/board1/list.to?local=free"><img
											src="/toto/top/img/more.JPG"></a>
									</c:if>
									<c:if test="${local=='advice'}">
										<a style="float: right"
											href="/toto/board1/list.to?local=advice"><img
											src="/toto/top/img/more.JPG"></a>
									</c:if>
									<a style="font-size: 9pt;" href="/toto/top/main.to?local=free">�����Խ���</a>��
									<a style="font-size: 9pt;"
										href="/toto/top/main.to?local=advice">���Խ���</a>
								</h4>

							</div>
							<div class="panel-body">

								<div id=wrap>
							
									<c:if test="${local=='Notice'}">
										<c:if test="${count3==0}">
								��ϵ� �Խñ��� �����ϴ�.
								</c:if>
										<c:if test="${count3 > 0}">
											<table border=1 width="300px" cellpadding="0" cellspacing="0"
												align="center" style="table-layout: fixed;">
												<tr height="10" bgcolor="#E7E7E7">
													<td align="center" width="150">�� ��</td>

													<td align="center" width="100">�ۼ���</td>

												</tr>

												<c:forEach var="brdlist1" items="${brdlist1}">
													<tr height="30">

														<td align="center" class="myoverflow" nowrap><a
															href="/toto/board1/content.to?num=${brdlist1.num}&pageNum=${currentPage}&local=${local}">${brdlist1.subject}</a>
														</td>

														<td align="center" width="100">${brdlist1.reg}</td>


													</tr>
												</c:forEach>

											</table>
										</c:if>
									</c:if>


									<c:if test="${local=='free'}">
									
								<c:if test="${count2==0}">
									<table align="center">
												<tr><td>
										��ϵ� �Խñ��� �����ϴ�.
										</td></tr>
										</table>
								</c:if>
										<c:if test="${count2 > 0}">
											<table width="300px" border=1 cellpadding="0" cellspacing="0"
												align="center" style="table-layout: fixed;">
												<tr height="10" bgcolor="#E7E7E7">
													<td align="center" width="150">�� ��</td>

													<td align="center" width="100">�ۼ���</td>

												</tr>


												<c:forEach var="brdlist2" items="${brdlist2}">
													<tr height="30">
														<td align="center" class="myoverflow" nowrap><a
															href="/toto/board1/content.to?num=${brdlist2.num}&pageNum=${currentPage}&local=${local}">${brdlist2.subject}</a>
														</td>

														<td align="center" width="100">${brdlist2.reg}</td>


													</tr>
												</c:forEach>
											</table>
										</c:if>
									</c:if>

									<c:if test="${local=='advice'}">
										<c:if test="${count4==0}">
											<table align="center">
												<tr><td>
										��ϵ� �Խñ��� �����ϴ�.
										</td></tr>
										</table>
										</c:if>
										
										<c:if test="${count4 > 0}">
											<table width="300px" border=1 cellpadding="0" cellspacing="0"
												align="center" style="table-layout: fixed;">
												<tr height="10" bgcolor="#E7E7E7">
													<td align="center" width="150">�� ��</td>

													<td align="center" width="100">�ۼ���</td>

												</tr>


												<c:forEach var="brdlist3" items="${brdlist3}">
													<tr height="30">
														<td align="center"><a
															href="/toto/board1/content.to?num=${brdlist3.num}&pageNum=${currentPage}&local=${local}">${brdlist3.subject}</a>
														</td>

														<td align="center" width="100">${brdlist3.reg}</td>


													</tr>
												</c:forEach>
											</table>
										</c:if>
									</c:if>
								</div>

							</div>
						</div>
					</div>

				</div>
		</div>
		<div class="row">
			<div class="col-lg-12">
				<h2 class="page-header">K����</h2>
				Ŭ���Ͻø� �� ������ ���� �ֽ��ϴ�.
			</div>
			<table width=100% align="center">
				<tr>
					<td><a
						href="/toto/teaminfomation/teamcontent.to?teamname=�λ�&snum=${6}&league=K����">
							<img src="/toto/top/img/team/kleague/busan.JPG">
					</a></td>
					<td><a
						href="/toto/teaminfomation/teamcontent.to?teamname=����&snum=${6}&league=K����">
							<img src="/toto/top/img/team/kleague/daejeon.JPG">
					</a></td>
					<td><a
						href="/toto/teaminfomation/teamcontent.to?teamname=����&snum=${6}&league=K����">
							<img src="/toto/top/img/team/kleague/gwangju.JPG">
					</a></td>
					<td><a
						href="/toto/teaminfomation/teamcontent.to?teamname=��õ&snum=${6}&league=K����">
							<img src="/toto/top/img/team/kleague/incheon.JPG">
					</a></td>
					<td><a
						href="/toto/teaminfomation/teamcontent.to?teamname=����&snum=${6}&league=K����">
							<img src="/toto/top/img/team/kleague/jeju.JPG">
					</a></td>
					<td><a
						href="/toto/teaminfomation/teamcontent.to?teamname=����&snum=${6}&league=K����">
							<img src="/toto/top/img/team/kleague/jeonbook.JPG">
					</a></td>
					<td><a
						href="/toto/teaminfomation/teamcontent.to?teamname=����&snum=${6}&league=K����">
							<img src="/toto/top/img/team/kleague/jeonnam.JPG">
					</a></td>
					<td><a
						href="/toto/teaminfomation/teamcontent.to?teamname=����&snum=${6}&league=K����">
							<img src="/toto/top/img/team/kleague/pohang.JPG">
					</a></td>
					<td><a
						href="/toto/teaminfomation/teamcontent.to?teamname=����&snum=${6}&league=K����">
							<img src="/toto/top/img/team/kleague/seongnam.JPG">
					</a></td>
					<td><a
						href="/toto/teaminfomation/teamcontent.to?teamname=����&snum=${6}&league=K����">
							<img src="/toto/top/img/team/kleague/seoul.JPG">
					</a></td>
					<td><a
						href="/toto/teaminfomation/teamcontent.to?teamname=����&snum=${6}&league=K����">
							<img src="/toto/top/img/team/kleague/suwon.JPG">
					</a></td>
					<td><a
						href="/toto/teaminfomation/teamcontent.to?teamname=���&snum=${6}&league=K����">
							<img src="/toto/top/img/team/kleague/ulsan.JPG">
					</a></td>
				</tr>
			</table>
		</div>
		<div class="row">
			<div class="col-lg-12">
				<h2 class="page-header">KBO</h2>
				Ŭ���Ͻø� �� ������ ���� �ֽ��ϴ�.
			</div>
			<table width=100% align="center">
				<tr>
					<td><a
						href="/toto/teaminfomation/teamcontent.to?teamname=�λ�&snum=${6}&league=KBO">
							<img src="/toto/top/img/team/kbo/doosan.GIF">
					</a></td>
					<td><a
						href="/toto/teaminfomation/teamcontent.to?teamname=��ȭ&snum=${6}&league=KBO">
							<img src="/toto/top/img/team/kbo/hanhwa.GIF">
					</a></td>
					<td><a
						href="/toto/teaminfomation/teamcontent.to?teamname=KIA&snum=${6}&league=KBO">
							<img src="/toto/top/img/team/kbo/kia.GIF">
					</a></td>
					<td><a
						href="/toto/teaminfomation/teamcontent.to?teamname=KT&snum=${6}&league=KBO">
							<img src="/toto/top/img/team/kbo/kt.GIF">
					</a></td>
					<td><a
						href="/toto/teaminfomation/teamcontent.to?teamname=LG&snum=${6}&league=KBO">
							<img src="/toto/top/img/team/kbo/lg.GIF">
					</a></td>
					<td><a
						href="/toto/teaminfomation/teamcontent.to?teamname=�Ե�&snum=${6}&league=KBO">
							<img src="/toto/top/img/team/kbo/lotte.GIF">
					</a></td>
					<td><a
						href="/toto/teaminfomation/teamcontent.to?teamname=NC&snum=${6}&league=KBO">
							<img src="/toto/top/img/team/kbo/nc.GIF">
					</a></td>
					<td><a
						href="/toto/teaminfomation/teamcontent.to?teamname=�ؼ�&snum=${6}&league=KBO">
							<img src="/toto/top/img/team/kbo/nexen.GIF">
					</a></td>
					<td><a
						href="/toto/teaminfomation/teamcontent.to?teamname=�Ｚ&snum=${6}&league=KBO">
							<img src="/toto/top/img/team/kbo/samsung.GIF">
					</a></td>
					<td><a
						href="/toto/teaminfomation/teamcontent.to?teamname=SK&snum=${6}&league=KBO">
							<img src="/toto/top/img/team/kbo/sk.GIF">
					</a></td>
				</tr>
			</table>
		</div>
		<div class="row">
			<div class="col-lg-12">
				<h2 class="page-header">KBL</h2>
				Ŭ���Ͻø� �� ������ ���� �ֽ��ϴ�.
			</div>
			<table width=100% align="center">
				<tr>
					<td><a
						href="/toto/teaminfomation/teamcontent.to?teamname=�λ�KT&snum=${6}&league=KBL">
							<img src="/toto/top/img/team/kbl/busankt.GIF">
					</a></td>
					<td><a
						href="/toto/teaminfomation/teamcontent.to?teamname=â��LG&snum=${6}&league=KBL">
							<img src="/toto/top/img/team/kbl/changwon.GIF">
					</a></td>
					<td><a
						href="/toto/teaminfomation/teamcontent.to?teamname=���ֵ���&snum=${6}&league=KBL">
							<img src="/toto/top/img/team/kbl/dongbu.GIF">
					</a></td>
					<td><a
						href="/toto/teaminfomation/teamcontent.to?teamname=����KCC&snum=${6}&league=KBL">
							<img src="/toto/top/img/team/kbl/kcc.GIF">
					</a></td>
					<td><a
						href="/toto/teaminfomation/teamcontent.to?teamname=�Ⱦ�KGC&snum=${6}&league=KBL">
							<img src="/toto/top/img/team/kbl/kgc.GIF">
					</a></td>
					<td><a
						href="/toto/teaminfomation/teamcontent.to?teamname=��õ���ڷ���&snum=${6}&league=KBL">
							<img src="/toto/top/img/team/kbl/land.GIF">
					</a></td>
					<td><a
						href="/toto/teaminfomation/teamcontent.to?teamname=�����&snum=${6}&league=KBL">
							<img src="/toto/top/img/team/kbl/mobis.GIF">
					</a></td>
					<td><a
						href="/toto/teaminfomation/teamcontent.to?teamname=�������½�&snum=${6}&league=KBL">
							<img src="/toto/top/img/team/kbl/orions.GIF">
					</a></td>
					<td><a
						href="/toto/teaminfomation/teamcontent.to?teamname=����Ｚ&snum=${6}&league=KBL">
							<img src="/toto/top/img/team/kbl/seoulsamsung.GIF">
					</a></td>
					<td><a
						href="/toto/teaminfomation/teamcontent.to?teamname=����SK&snum=${6}&league=KBL">
							<img src="/toto/top/img/team/kbl/seoulsk.GIF">
					</a></td>
				</tr>
			</table>
		</div>
		<!-- /.row -->

		<!-- Features Section -->
		<!--  <div class="row">
			<div class="col-lg-12">
				<h2 class="page-header">����� ���� ���� ����</h2>
			</div>

		</div>  -->
		<!-- /.row -->

		<hr>



		<!-- Footer -->
		<footer>
		<div class="row">
			<div class="col-lg-12">
				<p>
					ü��������ǥ�� ���� ���ͳ� �߸Ż���Ʈ�� ��Ʈ���Դϴ�.</br> �� ���� ����Ʈ�� ���� ��ǥ�ǹ��� ���������� ������ �����Ǿ�
					�ֽ��ϴ�.</br> ü��������ǥ�� ��ǥ�Ǹ��� ��ϻ�ǥ�μ� ���� ����� ��� ���� ���縦 ���� �� �ֽ��ϴ�.</br> </br> ��ſ� ������,
					��ſ� ����, �Ҿ����� �����ϰ� ��⼼��.</br> ȸ���� 1�� 10�������� �����Ͻ� �� �ֽ��ϴ�. û�ҳ��� ��ǥ���� �����ϰų�
					ȯ�ޱ��� ������ �� �����ϴ�.</br> </br> ü��������ǥ�� ���ͳ� �߸� ��Ź����� (��)�������� �� ��ǥ�ڸ� ��μ� �� ����ڵ�Ϲ�ȣ
					100-00-00000 �� ���� help@betman.co.kr</br> ����Ư���� ������ ��ϻ�� 34 �� �������ȭ
					1588-0000 �� �ѽ� 02-0000-0000</br> COPYRIGHT�� ����ü��������� ALL RIGHTS RESERVED
				</p>

			</div>
		</div>
		</footer>

	</div>

</div>
	