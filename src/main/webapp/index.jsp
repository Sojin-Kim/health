<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<style>
#maincards{
    padding-top: 40px;
    padding-bottom: 40px;
    padding-left: 200px;
    padding-right: 200px;
    
}
.menupic{
	height:200px;
}
</style>
<!-- 
  메인 화면
  2023/07/07 ksj 추가 (헤더 샘플을 위해 추가함.)
-->
<div id="maincards">
	<div class="row row-cols-1 row-cols-md-3 g-4">
	  <div class="col">
	    <div class="card h-100">
	      <img src="${pageContext.request.contextPath}/resources/image/image3.jpg" class="card-img-top menupic" alt="...">
	      <div class="card-body">
	        <h5 class="card-title">Card title</h5>
	        <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
	      </div>
	    </div>
	  </div>
	  <div class="col">
	    <div class="card h-100">
	      <img src="${pageContext.request.contextPath}/resources/image/image3.jpg" class="card-img-top menupic" alt="...">
	      <div class="card-body">
	        <h5 class="card-title">Card title</h5>
	        <p class="card-text">This is a short card.</p>
	      </div>
	    </div>
	  </div>
	  <div class="col">
	    <div class="card h-100">
	      <img src="${pageContext.request.contextPath}/resources/image/image3.jpg" class="card-img-top menupic" alt="...">
	      <div class="card-body">
	        <h5 class="card-title">Card title</h5>
	        <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content.</p>
	      </div>
	    </div>
	  </div>
	</div>
</div>
<div id="maincards">
	<div class="row row-cols-1 row-cols-md-3 g-4">
	  <div class="col">
	    <div class="card h-100">
	      <img src="${pageContext.request.contextPath}/resources/image/image3.jpg" class="card-img-top menupic" alt="...">
	      <div class="card-body">
	        <h5 class="card-title">Card title</h5>
	        <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
	      </div>
	    </div>
	  </div>
	  <div class="col">
	    <div class="card h-100">
	      <img src="${pageContext.request.contextPath}/resources/image/image3.jpg" class="card-img-top menupic" alt="...">
	      <div class="card-body">
	        <h5 class="card-title">Card title</h5>
	        <p class="card-text">This is a short card.</p>
	      </div>
	    </div>
	  </div>
	  <div class="col">
	    <div class="card h-100">
	      <img src="${pageContext.request.contextPath}/resources/image/image3.jpg" class="card-img-top menupic" alt="...">
	      <div class="card-body">
	        <h5 class="card-title">Card title</h5>
	        <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content.</p>
	      </div>
	    </div>
	  </div>
	</div>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>