<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<section class="spad">
	<div class="container">
		<div class="wishList">

			<div class="row">
				<!-- 주문없음 -->
				<c:if test="${empty page.content}">
					<div class="col-lg-12">
						<div class="contact__form__title">
							<h3>찜한 상품이 없습니다.</h3>
							<button type="button" class="site-btn mt-5" onclick="location.href='/product/wishRangeList'">상품 보러가기</button>
						</div>
					</div>
				</c:if>

				<!-- 찜 리스트 -->
				<c:forEach var="wishListDTO" items="${page.content}">
					<div class="col-lg-3 col-md-4 col-sm-6">
						<div class="product__item">
							<img src="../../../../../img/product/${wishListDTO.representativeImage}"
								 onclick="location.href='/product/detail/${wishListDTO.productId}';" width="500px;" height="300px;">
<%--							<div class="product__item__pic set-bg pointer" data-setbg="/img/product/${wishListDTO.representativeImage}"--%>
<%--									 onclick="location.href='/product/detail/${wishListDTO.productId}';">--%>
<%--								<div style="margin-top:93%;"><img src="/template/img/product/pay.png"></div>--%>

							<div class="product__item__text">
								<h6><a href="/product/detail/${wishListDTO.productId}">${wishListDTO.subject}</a></h6>
								<h5><fmt:formatNumber type="number" maxFractionDigits="3" value="${wishListDTO.price}"/>원</h5>
								<h6 class="grey">${wishListDTO.memberNickname} / ${wishListDTO.townName}</h6>
								<ul class="product__wish__item">
									<input type="hidden" id="productId" value="${wishListDTO.productId}"/>
									<li class="chatroomBtn ${empty wishListDTO.chatroomId ? "" : "true"}"><a><i class="fa fa-weixin"></i></a></li>
									<li class="wishBtn true"><a><i class="fa fa-heart"></i></a></li>
								</ul>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>

			<!-- List Paging -->
			<div class="row">
				<div class="col-lg-12">

					<!-- 페이징 -->
					<c:if test="${!empty page.content && page.totalPages != 1}">
						<input type="hidden" id="pageNumber" value="${page.number + 1}"/>
						<div class="product__pagination text-center">
							<c:set var="block" value="10"/><%-- 10 --%>
							<fmt:parseNumber var="pageNumber" integerOnly="true" value="${page.number / block}"/><%-- 현재페이지 : 0 ~ --%>
							<c:set var="startNumber" value="${pageNumber * block}"/><%-- 0 * size ~ --%>
							<c:set var="endNumber" value="${page.totalPages > (pageNumber + 1) * block ? (pageNumber + 1) * block - 1 : page.totalPages - 1}"/>

							<c:if test="${page.totalPages > block && page.number + 1 > block}">
								<a href="?page=0"><<</a>
								<a href="?page=${startNumber - 1}"><</a>
							</c:if>
							<c:forEach var="currentNumber" begin="${startNumber}" end="${endNumber}">
								<a href="?page=${currentNumber}">${currentNumber + 1}</a>
							</c:forEach>
							<c:if test="${page.totalPages - 1 > endNumber}">
								<a href="?page=${endNumber + 1}">></a>
								<a href="?page=${page.totalPages - 1}">>></a>
							</c:if>
						</div>
					</c:if>

				</div>
			</div>
			<!-- List Paging End -->

		</div>
	</div>
</section>

<script>
</script>