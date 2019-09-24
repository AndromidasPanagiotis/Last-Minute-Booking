<%-- 
    Document   : customer_services
    Created on : 28 Ιουλ 2019, 9:36:40 μμ
    Author     : minas
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>

    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage your hotels</title>

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

        <link rel="stylesheet" type="text/css" href="../resources/css/customer_services.css">
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" >

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
        <nav class="navbar navbar-expand-lg navbar-light bg-navy">
            <a class="navbar-brand"><img src='../resources/media/logo120x60.svg'></a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                    aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <a id="home_link" class="nav-link rounded" href="${pageContext.request.contextPath}/user/customerCentral" tabindex="-1" aria-disabled="true">Home</a>
                    </li>
                </ul>
                <form class="form-inline my-2 my-lg-0">
                    <ul class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle text-white" href="#" id="navbarDropdown" role="button"
                           data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            ${sessionScope.loggedUser.name} ${sessionScope.loggedUser.surname}
                        </a>
                        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="#">View your profile</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="${pageContext.request.contextPath}/user/logout">Sign out</a>
                        </div>
                    </ul>
                </form>
            </div>
        </nav>

        <div class="container">
            <div class="row">

                <aside class="col-md-2 col-sm-2 col-xs-2 bg-navy" >
                    <ul class="list-group border-color-navy rounded">
                        <li class="list-group-item-secondary text-center py-2 list-unstyled bg-navy disabled"> <button
                                id="btn" class="btn btn-primary custom" type="button" data-toggle="collapse"
                                data-target="#multiCollapseExample1" aria-expanded="false"
                                aria-controls="multiCollapseExample1">
                                <h2><strong>Services</strong></h2> </button></li>
                        <li class="list-group-item-secondary text-center py-2 list-unstyled bg-navy"> <button id="btn0"
                                                                                                              class="btn btn-primary custom" type="button" data-toggle="collapse"
                                                                                                              data-target="#multiCollapseExample0" aria-expanded="false"
                                                                                                              aria-controls="multiCollapseExample0">Bookings</button></li>
                        <li class="list-group-item-secondary text-center py-2 list-unstyled bg-navy"> <button id="btn1"
                                                                                                              class="btn btn-primary custom" type="button" data-toggle="collapse"
                                                                                                              data-target="#multiCollapseExample1" aria-expanded="false"
                                                                                                              aria-controls="multiCollapseExample1">Reviews</button></li>
                        <li class="list-group-item-secondary text-center py-2 list-unstyled bg-navy"><button id="btn2"
                                                                                                             class="btn btn-primary custom" type="button" data-toggle="collapse"
                                                                                                             data-target="#multiCollapseExample2" aria-expanded="false"
                                                                                                             aria-controls="multiCollapseExample2">Settings</button></li>
                        <li class="list-group-item-secondary text-center py-2 list-unstyled bg-navy"><a
                                href="${pageContext.request.contextPath}/user/logout"> <button
                                    class="btn btn-warning custom" type="button" data-toggle="collapse"
                                    data-target="#multiCollapseExample2" aria-expanded="false"
                                    aria-controls="multiCollapseExample2">Sign out</button></a></li>
                    </ul>

                </aside>
                <aside class="col-md-10 col-sm-10 col-xs-10 ">
                    <div class="jumbotron jumbotron-fluid bg-white zeropadding pad-top">
                        <div class="container fluid">
                            <div class="row">

                                <div class="col-md-12 col-sm-12 col-xs-12">
                                    <div class="collapse multi-collapse" id="Bookings_context">

                                        <h3 display="none"><p id="reservationsText" class="text text-center"></p></h3>
                                        <div id="reservationsform" class="shadow rounded mb-2">
                                            <table class="table table-bordered table-hover rounded ">
                                                <thead class="text-center">
                                                    <tr>
                                                        <th class="text-center align-middle">Start Date</th>
                                                        <th class="text-center align-middle" >End Date</th>
                                                        <th class="text-center align-middle">Hotel</th>
                                                        <th class="text-center align-middle">Address</th>
                                                        <th class="text-center align-middle">Area</th>
                                                        <th class="text-center align-middle">Total Cost</th>
                                                        <th class="text-center align-middle">Status</th>
                                                        <th class="text-center align-middle">Cancelation</th>
                                                        <th class="text-center align-middle">Payments</th>
                                                    </tr>
                                                </thead>
                                                <tbody class="text-center">
                                                    <c:forEach items = "${reservations}" var = "reservations">
                                                        <tr>
                                                            <td class="text-center align-middle">${reservations.startdate}</td>
                                                            <td class="text-center align-middle" >${reservations.enddate}</td>
                                                            <td class="text-center align-middle">${reservations.hotelid.name}</td>
                                                            <td class="text-center align-middle">${reservations.hotelid.address}</td>
                                                            <td class="text-center align-middle">${reservations.hotelid.destinationid.name}</td>
                                                            <td class="text-center align-middle">${reservations.totalcost}</td>
                                                            <td class="text-center align-middle" ><button class="text-white btn block " id="status${reservations.id}">
                                                                    <p id="buttonText${reservations.id}"></p></button></td>
                                                            <td class="text-center align-middle" id="delete${reservations.id}"><a  href="${pageContext.request.contextPath}/user/deletereservation/${reservations.id}"><button class="btn btn-danger block text-white" >
                                                                        <p id="buttonText${reservations.id}" class="text text-center"></p>CANCEL YOUR RESERVATION</button></a></td>
                                                            <td class="text-center align-middle" >
                                                                <div id="paypal-button"> </div>
                                                            </td>
                                                        </tr>
                                                    </c:forEach> 
                                                </tbody>    
                                            </table>
                                        </div>

                                    </div>
                                </div>

                                <div class="col-md-12 col-sm-12 col-xs-12">
                                    <div class="collapse multi-collapse" id="Reviews_context">
                                        <div class="card card-body border-color-navy rounded">
                                            <h3 display="none"><p id="ratingText" class="text text-center"></p></h3>
                                            <div id="ratingform">
                                                <form class="form-signin"
                                                      action="${pageContext.request.contextPath}/user/submitRating" method="POST">
                                                    <label class="bg-warning rounded block text-white text-center"><h3>Please, complete the assessment form for your residence from ${sessionScope.availableRatings.startdate} to ${sessionScope.availableRatings.enddate} at ${sessionScope.hotelRating.name},${sessionScope.hotelRating.destinationid.name}</h3></label>
                                                    <hr style="border-top: 1px solid #8c8b8b; margin-top: 0px;">
                                                    <div class="container">
                                                        <div class="row">
                                                            <div class="col-md-6 col-sm-6 col-xs-6">
                                                                <label><h4>General Assessment</h4></label>
                                                                <div class="rating">
                                                                    <input type="radio" name="GeneralAssessment" value="5" id="star1" ><label for="star1">           
                                                                    </label>
                                                                    <input type="radio" name="GeneralAssessment" value="4" id="star2"><label for="star2">           
                                                                    </label>
                                                                    <input type="radio" name="GeneralAssessment" value="3"  id="star3"><label for="star3">           
                                                                    </label>
                                                                    <input type="radio" name="GeneralAssessment" value="2" id="star4"><label for="star4">           
                                                                    </label>
                                                                    <input type="radio" name="GeneralAssessment" value="1" id="star5"><label for="star5">           
                                                                    </label>
                                                                </div>
                                                                <label><h4>Cleanliness</h4></label>
                                                                <div class="rating">
                                                                    <input type="radio" name="Cleanliness" value="5" id="star6"><label for="star6">           
                                                                    </label>
                                                                    <input type="radio" name="Cleanliness" value="4" id="star7"><label for="star7">           
                                                                    </label>
                                                                    <input type="radio" name="Cleanliness" value="3"  id="star8"><label for="star8">           
                                                                    </label>
                                                                    <input type="radio" name="Cleanliness" value="2" id="star9"><label for="star9">           
                                                                    </label>
                                                                    <input type="radio" name="Cleanliness" value="1" id="star10"><label for="star10">           
                                                                    </label>
                                                                </div>
                                                                <label><h4>Staffing</h4></label>
                                                                <div class="rating">
                                                                    <input type="radio" name="Staffing" value="5" id="star11"><label for="star11">           
                                                                    </label>
                                                                    <input type="radio" name="Staffing" value="4" id="star12"><label for="star12">           
                                                                    </label>
                                                                    <input type="radio" name="Staffing" value="3"  id="star13"><label for="star13">           
                                                                    </label>
                                                                    <input type="radio" name="Staffing" value="2" id="star14"><label for="star14">           
                                                                    </label>
                                                                    <input type="radio" name="Staffing" value="1" id="star15"><label for="star15">           
                                                                    </label>
                                                                </div>
                                                            </div>

                                                            <div class="col-md-6 col-sm-6 col-xs-6">
                                                                <label><h4>Hotel Facilities</h4></label>
                                                                <div class="rating">
                                                                    <input type="radio" name="HotelFacilities" value="5" id="star16"><label for="star16">           
                                                                    </label>
                                                                    <input type="radio" name="HotelFacilities" value="4" id="star17"><label for="star17">           
                                                                    </label>
                                                                    <input type="radio" name="HotelFacilities" value="3"  id="star18"><label for="star18">           
                                                                    </label>
                                                                    <input type="radio" name="HotelFacilities" value="2" id="star19"><label for="star19">           
                                                                    </label>
                                                                    <input type="radio" name="HotelFacilities" value="1" id="star20"><label for="star20">           
                                                                    </label>
                                                                </div>
                                                                <label><h4>Room Equipment</h4></label>
                                                                <div class="rating">
                                                                    <input type="radio" name="RoomEquipment" value="5" id="star21"><label for="star21">           
                                                                    </label>
                                                                    <input type="radio" name="RoomEquipment" value="4" id="star22"><label for="star22">           
                                                                    </label>
                                                                    <input type="radio" name="RoomEquipment" value="3"  id="star23"><label for="star23">           
                                                                    </label>
                                                                    <input type="radio" name="RoomEquipment" value="2" id="star24"><label for="star24">           
                                                                    </label>
                                                                    <input type="radio" name="RoomEquipment" value="1" id="star25"><label for="star25">           
                                                                    </label>
                                                                </div>

                                                            </div>
                                                            <label><h4>Comments</h4></label>
                                                            <textarea name="Comments" class="form-control rounded-0" id="description" rows="5"></textarea>
                                                        </div>
                                                    </div>
                                                    <button class="btn btn-lg btn-primary btn-block mt-2"
                                                            type="submit">Submit</button>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>


                                <div class="col-md-12 col-sm-12 col-xs-12">
                                    <div class="collapse multi-collapse" id="Settings_context">
                                        <div class="card card-body border-color-navy rounded">
                                            <form:form class="form-signin"
                                                       action="${pageContext.request.contextPath}/user/updateUserSettings" method="POST"
                                                       modelAttribute="updateUser">
                                                <h1 class="h3 mb-3 font-weight-normal">Please update your personal
                                                    information</h1>
                                                <form:label path="name">Type your first name
                                                </form:label>
                                                <form:input class="form-control mb-2" style="display:none" placeholder="First name" required="true"
                                                            autofocus="true" path="id" value="${sessionScope.loggedUser.id}" />
                                                <form:input class="form-control mb-2" style="display:none" placeholder="Role" required="true"
                                                            autofocus="true" path="role" value="${sessionScope.loggedUser.role.id}" />
                                                <form:input class="form-control mb-2" style="display:none" placeholder="serial" required="true"
                                                            autofocus="true" path="serial" value="${sessionScope.loggedUser.serial}" />
                                                <form:input class="form-control mb-2" style="display:none" placeholder="active" required="true"
                                                            autofocus="true" path="active" value="${sessionScope.loggedUser.active}" />
                                                <form:input class="form-control mb-2" id="nameUP" value="${sessionScope.loggedUser.name}" placeholder="First name" required="true"
                                                            autofocus="true" path="name" />
                                                <form:label path="surname">Type your last name
                                                </form:label>
                                                <form:input class="form-control mb-2" id="surnameUP" value="${sessionScope.loggedUser.surname}" placeholder="Last name" required="true"
                                                            path="surname" />
                                                <form:label path="address">Type your home address
                                                </form:label>
                                                <form:input class="form-control mb-2" id="addressUP" value="${sessionScope.loggedUser.address}" placeholder="Address" required="true"
                                                            path="address" />
                                                <form:label path="city">Type your city
                                                </form:label>
                                                <form:input class="form-control mb-2" id="cityUP" value="${sessionScope.loggedUser.city}" placeholder="City" required="true"
                                                            path="city" />
                                                <form:label path="postcode">Type your postcode area
                                                </form:label>
                                                <form:input class="form-control mb-2" id="postcodeUP" value="${sessionScope.loggedUser.postcode}" placeholder="Postcode" required="true"
                                                            path="postcode" />
                                                <form:label path="phone">Type your phone number
                                                </form:label>
                                                <form:input class="form-control mb-2" id="phoneUP" value="${sessionScope.loggedUser.phone}"  placeholder="Phone number" required="true"
                                                            path="phone" />
                                                <form:label path="email">Type your email address
                                                </form:label>
                                                <form:input class="form-control mb-2" id="emailUP" value="${sessionScope.loggedUser.email}" placeholder="Email address" required="true"
                                                            path="email" />
                                                <form:label path="username">Type your username
                                                </form:label>
                                                <form:input class="form-control mb-2" id="usernameUP" value="${sessionScope.loggedUser.username}" placeholder="Username" required="true"
                                                            path="username" />
                                                <form:label path="password">Type your password
                                                </form:label>
                                                <form:input type="password" class="form-control mb-2" 
                                                            required="true" path="password" />
                                          
                                                <button id="submitbutton" class="btn btn-lg btn-primary btn-block mt-2"
                                                        type="submit">Submit</button>

                                            </form:form>
                                        </div>
                                    </div>
                                </div>





                            </div>
                        </div>
                    </div>
                </aside>
            </div>
        </div>

        <script>
            window.onload = function () {
                displaybookingblock();
            };
            $('#Bookings_context').show();
            $('#btn0').click(function () {
                $('#Bookings_context').show();
                $('#Reviews_context').hide();
                $('#Settings_context').hide();
            });
            $('#btn1').click(function () {
                $('#Bookings_context').hide();
                $('#Reviews_context').show();
                $('#Settings_context').hide();
            });
            $('#btn2').click(function () {
                $('#Bookings_context').hide();
                $('#Reviews_context').hide();
                $('#Settings_context').show();
            });
            var ratingform = document.getElementById("ratingform");
            document.querySelector("#btn1").addEventListener("click", function () {
                displayblock();
            });
            function displayblock() {
            <c:if test="${availableRatings.userid == null}" >
                ratingform.style.display = "none";
                $("#ratingText").text("You don't have to rate any hotel");
                $("#ratingText").style.display = "block";
            </c:if>
            }
            ;
            var reservationsform = document.getElementById("reservationsform");
            document.querySelector("#btn0").addEventListener("click", function () {
                displaybookingblock();
            });
            function displaybookingblock() {
            <jsp:useBean id="now" class="java.util.Date"/>
            <c:if test="${reservations[0].userid == null}" >
                reservationsform.style.display = "none";
                $("#reservationsText").text("You haven't done any reservation until now.");
                $("#reservationsText").style.display = "block";
            </c:if>
            <c:forEach items = "${reservations}" var = "reservations">
                var buttonstatus = document.getElementById("status${reservations.id}");
                var buttondelete = document.getElementById("delete${reservations.id}");
                var buttonText = document.getElementById("buttonText${reservations.id}");
                <c:if test="${reservations.enddate lt now}" >
                buttondelete.style.display = "none";
                buttonstatus.classList.add("btn-success");
                buttonstatus.classList.add("block");
                $("#buttonText${reservations.id}").text("COMPLETE");
                </c:if>
                <c:if test="${reservations.enddate gt now}" >
                buttondelete.style.display = "block";
                buttonstatus.classList.add("btn-warning");
                buttonstatus.classList.add("block");
                $("#buttonText${reservations.id}").text("IN PRGOGRESS");
                </c:if>
            </c:forEach>
            }
            ;


            paypal.Button.render({
                // Configure environment
                env: 'sandbox',
                client: {
                    sandbox: 'demo_sandbox_client_id',
                    production: 'demo_production_client_id'
                },
                // Customize button (optional)
                locale: 'en_US',
                style: {
                    size: 'small',
                    color: 'gold',
                    shape: 'pill',
                }, // Enable Pay Now checkout flow (optional)
                commit: true, // Set up a payment
                payment: function (data, actions) {
                    return actions.payment.create({
                        
               
                        transactions: [{
                                amount: {
                                    total: '250',
                                    currency: 'EUR'
                                }
                            }]
                    });
                },
                // Execute the payment
                onAuthorize: function (data, actions) {
                    return actions.payment.execute().then(function () {
                        // Show a confirmation message to the buyer
                        window.alert('Thank you for your purchase!');
                    });
                }
            }, '#paypal-button');

        </script>

    </body>

</html>
