<%-- 
    Document   : EditAccount
    Created on : Mar 2, 2022, 9:09:03 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Crud</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="css/manager.css" rel="stylesheet" type="text/css"/>
        <style>
            img{
                width: 200px;
                height: 120px;
            }
        </style>
    <body>
        <div class="container">

            <div id="editEmployeeModal">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="EditAccountURL" method="post">
                            <div class="modal-header">						
                                <h4 class="modal-title">Edit Account</h4>
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            </div>
                            <div class="modal-body">					
                                <div class="form-group">
                                    <label>ID</label>
                                    <input value="${acc.user_id}" name="user_id" type="text" class="form-control" readonly required>
                                </div>
                                <div class="form-group">
                                    <label>User</label>
                                    <input value="${acc.userName}" name="userName" type="text" class="form-control" readonly required>
                                </div>
                                <div class="form-group">
                                    <label>Pass</label>
                                    <input value="${acc.password}" name="password" type="text" class="form-control"  readonly required>
                                </div>
                                <div class="form-group">
                                    <label>Name</label>
                                    <input value="${acc.full_name}" name="full_name" type="text" class="form-control"  readonly required>
                                </div>
                                <div class="form-group">
                                    <label>Phone</label>
                                    <input value="${acc.phone_number}" name="phone_number" type="text" class="form-control"  readonly required>
                                </div>
                                <div class="form-group">
                                    <label>is Admin</label>
                                    <input value="${acc.isAdmin}" name="isAdmin" type="text" class="form-control"  readonly required>
                                </div>
                                <div class="form-group">
                                    <label>is Sell</label>
                                    <input value="${acc.isSell}" name="isSell" type="text" class="form-control" readonly required>
                                </div>
                                <div class="form-group">
                                    <label>Active</label>
                                    <select class="form-control" name="active">
                                        <option value="1"
                                                <c:if test="${acc.active==1}">
                                                    selected
                                                </c:if>
                                                >True</option>
                                        <option value="0"
                                                <c:if test="${acc.active==0}">
                                                    selected
                                                </c:if>
                                                >False</option>
                                    </select> 
                                </div>
                            </div>
                            <div class="modal-footer">
                                <input type="submit" class="btn btn-success" value="Edit">
                            </div>
                        </form>
                    </div>
                </div>
            </div>

        </div>


        <script src="js/manager.js" type="text/javascript"></script>
    </body>
</html>