<%-- 
    Document   : Cart
    Created on : Oct 31, 2020, 9:42:21 PM
    Author     : trinh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    </head>

    <body>
        <jsp:include page="Menu.jsp"></jsp:include>
        <c:choose>
            <c:when test="${sessionScope.carts==null||sessionScope.carts.size()==0}">
                <h1>List Cart is Empty</h1>
            </c:when>
            <c:otherwise>
                <div class="shopping-cart">
                    <div class="px-4 px-lg-0">

                        <div class="pb-5">
                            <div class="container">
                                <div class="row">
                                    <div class="col-lg-12 p-5 bg-white rounded shadow-sm mb-5">

                                        <!-- Shopping cart table -->
                                        <div class="table-responsive">
                                            <table class="table">
                                                <thead>
                                                    <tr>
                                                        <th scope="col" class="border-0 bg-light">
                                                            <div class="p-2 px-3 text-uppercase">Sản Phẩm</div>
                                                        </th>
                                                        <th scope="col" class="border-0 bg-light">
                                                            <div class="py-2 text-uppercase">Đơn Giá</div>
                                                        </th>
                                                        <th scope="col" class="border-0 bg-light">
                                                            <div class="py-2 text-uppercase">Số Lượng</div>
                                                        </th>
                                                        <th scope="col" class="border-0 bg-light">
                                                            <div class="py-2 text-uppercase">Xóa</div>
                                                        </th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach items="${carts}" var="o">
                                                    <form action="update-quantity">
                                                        <tr>
                                                        <input type="hidden" name="productId" value="${o.getValue().getProduct().getProduct_id()}"/>
                                                        <th scope="row">
                                                            <div class="p-2">
                                                                <img src="${o.getValue().getProduct().getImage()}" alt="" width="70" class="img-fluid rounded shadow-sm">
                                                                <div class="ml-3 d-inline-block align-middle">
                                                                    <h5 class="mb-0"> <a href="#" class="text-dark d-inline-block">${o.getValue().getProduct().getProduct_name()}</a></h5><span class="text-muted font-weight-normal font-italic"></span>
                                                                </div>
                                                            </div>
                                                        </th>
                                                        <td class="align-middle"><strong>${o.getValue().getProduct().getPrice()*o.getValue().getQuantity()}</strong></td>
                                                        <td class="align-middle"><input onchange="this.form.submit()" type="number" name="quantity" value="${o.getValue().getQuantity()}"/></td>
                                                        <td class="align-middle"><a href="deleteCart?productID=${o.getValue().getProduct().getProduct_id()}" class="text-dark">
                                                                <button type="button" class="btn btn-danger">Delete</button>
                                                            </a>
                                                        </td>
                                                        </tr> 
                                                    </form>
                                                </c:forEach>
                                                </tbody>
                                            </table>
                                            <h3>Total Amount: $${totalMoney}</h3>
                                            <a href="checkOutURL" class="btn btn-success w-25">Check out</a>
                                        </div>
                                        <!-- End -->
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </c:otherwise>
        </c:choose>                
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    </body>

</html>
</html>
