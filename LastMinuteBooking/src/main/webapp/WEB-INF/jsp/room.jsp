<%-- 
    Document   : room
    Created on : 21 Ιουλ 2019, 9:11:09 μμ
    Author     : minas
--%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>

        <!-- Bootstrap core CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

        <link rel="stylesheet" type="text/css" href="../../resources/css/room.css">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Document</title>
        <script src="https://www.paypalobjects.com/api/checkout.js"></script>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
                integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
                integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
                integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>
    </head>

    <body>

        <!-- NAVBAR -->
        <nav class="navbar navbar-expand-lg navbar-white bg-navy">
            <a class="navbar-brand" href="#"><img src='../../resources/media/logo120x60.svg'></a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                    aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav ml-auto ">
                    <li class="nav-item">
                        <a id="home_link" class="nav-link rounded" href="${pageContext.request.contextPath}/user/customerCentral" tabindex="-1" aria-disabled="true">Home</a>
                    </li>
                </ul>
                <form class="form-inline my-2 my-lg-0">
                    <ul id="dropdown_customer" class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle text-white" href="#" id="navbarDropdown" role="button"
                           data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            ${sessionScope.loggedUser.name}, ${sessionScope.loggedUser.surname}
                        </a>
                        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="${pageContext.request.contextPath}/user/customer_services">View your profile</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="${pageContext.request.contextPath}/user/logout">Sign out</a>
                        </div>
                    </ul>
                </form>
            </div>
        </nav>

        <div class="container">
            <div class="row">
                <aside class="col-md-3 col-sm-3 col-xs-3" style="padding-top: 35px;">


                    <div class="card">
                        <article class="card-group-item">
                            <header class="card-header bg-navy">
                                <h6 class="title text-white align-middle">Comments</h6>
                            </header>
                            <c:forEach items = "${comments}" var = "comments">
                                <table class="table ">
                                    <tbody>
                                        <tr>
                                            <td class="align-middle"> <texterea>${comments.comments}</texterea></td>
                                    </tr>
                                    </tbody>
                                </table>
                            </c:forEach>
                            </aside>

                            <!-- Hotel List -->
                            <aside class="col-md-9 col-sm-9 col-xs-9">
                                <!-- Hotel -->
                                <div class="container">
                                    <div class="jumbotron jumbotron-fluid bg-white " style="padding-top:15px; padding-bottom:15px">
                                        <div class="container">
                                            <div class="row">
                                                <div class="col-md-12 col-sm-12 col-xs-12">
                                                    <p class="text-left">
                                                    <h1 class="title text-navy" style="font-weight: bold; ">${searchRooms.get(0).hotelid.name}</h1>
                                                    </p>
                                                </div>
                                                <div class="col-md-12 col-sm-12 col-xs-12 " >
                                                    <div class="text-center">
                                                        <hr>


                                                        <div id="myCarousel" class="carousel slide" data-ride="carousel">
                                                            <!-- Carousel indicators -->
                                                            <ol class="carousel-indicators">
                                                                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                                                                <li data-target="#myCarousel" data-slide-to="1"></li>
                                                                <li data-target="#myCarousel" data-slide-to="2"></li>
                                                                <li data-target="#myCarousel" data-slide-to="3"></li>
                                                            </ol>
                                                            <!-- Wrapper for carousel items -->
                                                            <div class="carousel-inner">
                                                                <div class="carousel-item active">
                                                                    <img src="../../resources/media/HotelPhotos/${searchRooms.get(0).hotelid.id}/1.jpg"  style='width:100%;height:600px' alt="First Slide">
                                                                </div>
                                                                <div class="carousel-item">
                                                                    <img src="../../resources/media/HotelPhotos/${searchRooms.get(0).hotelid.id}/2.jpg" style='width:100%;height:600px' alt="Second Slide">
                                                                </div>
                                                                <div class="carousel-item">
                                                                    <img src="../../resources/media/HotelPhotos/${searchRooms.get(0).hotelid.id}/3.jpg" style='width:100%;height:600px' alt="Third Slide">
                                                                </div>
                                                                <div class="carousel-item">
                                                                    <img src="../../resources/media/HotelPhotos/${searchRooms.get(0).hotelid.id}/4.jpg" style='width:100%;height:600px' alt="Third Slide">
                                                                </div>
                                                            </div>
                                                            <!-- Carousel controls -->
                                                            <a class="carousel-control-prev text-navy" href="#myCarousel" data-slide="prev">
                                                                <span class="carousel-control-prev-icon"></span>
                                                            </a>
                                                            <a class="carousel-control-next" href="#myCarousel" data-slide="next">
                                                                <span class="carousel-control-next-icon"></span>
                                                            </a>
                                                        </div>

                                                    </div>
                                                </div>
                                                <div class="col-md-12 col-sm-12 col-xs-12">
                                                    <hr>
                                                    <p class="text-left">
                                                    <h3 class="title text-navy" style="font-weight: bold">Description</h3>
                                                    </p>
                                                    <texterea>${searchRooms.get(0).hotelid.description}</texterea>
                                                </div>



                                                <div class="col-md-12 col-sm-12 col-xs-12">
                                                    <hr>
                                                    <p class="text-left">
                                                    <h3 class="title text-navy" style="font-weight: bold">Most popular facilities
                                                    </h3>
                                                    </p>
                                                    <div class="d-flex justify-content-start">
                                                        <div class="important_facility" id="Non_Smoking_Room">
                                                            <img style="width:20px;height:20px" src="../../resources/media/no-smoking.svg">
                                                            Non Smoking Room&nbsp;&nbsp;&nbsp;&nbsp;
                                                        </div>
                                                        <div class="important_facility" id="Pool">
                                                            <img style="width:20px;height:20px" src="../../resources/media/swimming-silhouette.svg">
                                                            Pool&nbsp;&nbsp;&nbsp;&nbsp;
                                                        </div>
                                                        <div class="important_facility" id="Bar">
                                                            <img style="width:20px;height:20px" src="../../resources/media/cocktail.svg">
                                                            Bar&nbsp;&nbsp;&nbsp;&nbsp;
                                                        </div>
                                                        <div class="important_facility" id="Free_Wi-fi">
                                                            <img style="width:20px;height:20px" src="../../resources/media/wifi.svg">
                                                            Free Wi-fi&nbsp;&nbsp;&nbsp;&nbsp;
                                                        </div>
                                                        <div class="important_facility" id="Parking">
                                                            <img style="width:20px;height:20px" src="../../resources/media/parking.svg">
                                                            Parking
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="col-md-12 col-sm-12 col-xs-12">
                                                    <hr>
                                                    <p class="text-left">
                                                    <h3 class="title text-navy" style="font-weight: bold">Availability</h3>
                                                    </p>
                                                    <table class="table table-bordered">
                                                        <thead>
                                                            <tr align="center">
                                                                <th class="bg-navy text-white">Room Type</th>
                                                                <th class="bg-navy text-white">Sleeps</th>
                                                                <th class="bg-navy text-white">Room Equipments</th>
                                                                <th class="bg-navy text-white">Price for ${nights} nights</th>
                                                                <th class="bg-navy text-white"></th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <c:forEach items = "${searchRooms}" var = "room"> 
                                                                <tr>
                                                                    <td align="center" style="vertical-align:middle;">${room.name}</td>
                                                                    <td align="center" style="vertical-align:middle;">${room.capacity}</td>
                                                                    <td align="center" style="vertical-align:middle;">
                                                                        <ul class="list-group list-group-flush">
                                                                            <c:forEach items = "${roomequipment}" var = "roomequipments"> 
                                                                                <c:if test = "${roomequipments.room.id == room.id}">
                                                                                    <li class="list-group-item py-0 ">${roomequipments.equipment.name}</li>
                                                                                    </c:if>
                                                                                </c:forEach>
                                                                        </ul></td>
                                                                        <c:forEach items = "${totalcostlist}" var = "totalcostlist"> 
                                                                            <c:if test = "${totalcostlist.key == room.id}">
                                                                            <td id="TotalCost${totalcostlist.key}" align="center" style="vertical-align:middle;">${totalcostlist.value}</td>

                                                                            <td ><h6 class="title text-white"> <a href="${pageContext.request.contextPath}/user/reserve/${room.hotelid.id}/${room.id}/${totalcostlist.value}"><button class="btn btn-warning btn-lg btn-block" type="button" id="myBtn">I'll reserve</button></a></h6>
                                                                            </td>
                                                                        </c:if>
                                                                    </c:forEach>
                                                                </tr>
                                                            </c:forEach> 
                                                        </tbody>
                                                    </table>

                                                </div>



                                            </div>
                                        </div>
                                    </div>
                                </div>
                                </div>
                                </div>
                                </div>
                                </div>
                                </div>
                                </div>
                                <!-- End Hotel -->
                            </aside>
                            <!-- End Hotel List-->

                    </div>
            </div>

            <script>
                $(document).ready(function () {
                    $("#myCarousel").carousel();
                });


            </script>



    </body>
</html>
