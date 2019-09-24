<%-- 
    Document   : owner_central
    Created on : Jul 6, 2019, 2:48:58 PM
    Author     : Panos
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

        <link rel="stylesheet" type="text/css" href="../resources/css/owner_central.css">

        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAw2rbACCi2uAkd_jkTHIh4aggS-irgrRQ&libraries=places&callback=initAutocomplete"
        async defer></script>


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
                <ul class="navbar-nav mr-auto">
                </ul>
                <form class="form-inline my-2 my-lg-0">

                    <a class="nav-link  text-white" href="#" id="navbarDropdown" role="button"
                       data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Welcome, ${sessionScope.loggedUser.name} ${sessionScope.loggedUser.surname}
                    </a>

                </form>
            </div>
        </nav>

        <div class="container">
            <div class="row">

                <aside class="col-md-2 col-sm-2 col-xs-2 bg-navy">
                    <ul class="list-group border-color-navy rounded">
                        <li class="list-group-item-secondary text-center py-2 list-unstyled bg-navy disabled"> <button
                                id="btn" class="btn btn-primary custom" type="button" data-toggle="collapse"
                                data-target="#multiCollapseExample1" aria-expanded="false"
                                aria-controls="multiCollapseExample1">
                                <h2><strong>Services</strong></h2>
                            </button></li><li class="list-group-item-secondary text-center py-2 list-unstyled bg-navy"> <button id="btnmap"
                                                                                                                            class="btn btn-primary custom" type="button" data-toggle="collapse"
                                                                                                                            data-target="#multiCollapseExamplemap" aria-expanded="false"
                                                                                                                            aria-controls="multiCollapseExamplemap" >Show on Map</button></li>
                        <li class="list-group-item-secondary text-center py-2 list-unstyled bg-navy"> <button id="btn0"
                                                                                                              class="btn btn-primary custom" type="button" data-toggle="collapse"
                                                                                                              data-target="#multiCollapseExample0" aria-expanded="false"
                                                                                                              aria-controls="multiCollapseExample0">Hotel List</button></li>
                        <li class="list-group-item-secondary text-center py-2 list-unstyled bg-navy"> <button id="btn1"
                                                                                                              class="btn btn-primary custom" type="button" data-toggle="collapse"
                                                                                                              data-target="#multiCollapseExample1" aria-expanded="false"
                                                                                                              aria-controls="multiCollapseExample1">Add Hotel</button></li>
                        <li class="list-group-item-secondary text-center py-2 list-unstyled bg-navy"><button id="btn2"
                                                                                                             class="btn btn-primary custom" type="button" data-toggle="collapse"
                                                                                                             data-target="#multiCollapseExample2" aria-expanded="false"
                                                                                                             aria-controls="multiCollapseExample2">Update Hotel</button></li>
                        <li class="list-group-item-secondary text-center py-2 list-unstyled bg-navy"> <button id="btn3"
                                                                                                              class="btn btn-primary custom" type="button" data-toggle="collapse"
                                                                                                              data-target="#multiCollapseExample3" aria-expanded="false"
                                                                                                              aria-controls="multiCollapseExample3">Add Room</button> </li>
                        <li class="list-group-item-secondary text-center py-2 list-unstyled bg-navy"> <button id="btn4"
                                                                                                              class="btn btn-primary custom" type="button" data-toggle="collapse"
                                                                                                              data-target="#multiCollapseExample4" aria-expanded="false"
                                                                                                              aria-controls="multiCollapseExample4">Update Room</button> </li>
                        <li class="list-group-item-secondary text-center py-2 list-unstyled bg-navy"> <button id="btn5"
                                                                                                              class="btn btn-primary custom" type="button" data-toggle="collapse"
                                                                                                              data-target="#multiCollapseExample5" aria-expanded="false"
                                                                                                              aria-controls="multiCollapseExample5">Declare Room Unavailability</button> </li>
                        <li class="list-group-item-secondary text-center py-2 list-unstyled bg-navy"> <button id="btn6"
                                                                                                              class="btn btn-primary custom" type="button" data-toggle="collapse"
                                                                                                              data-target="#multiCollapseExample6" aria-expanded="false"
                                                                                                              aria-controls="multiCollapseExample6">Settings</button> </li>
                        <li class="list-group-item-secondary text-center py-2 list-unstyled bg-navy"><a href="${pageContext.request.contextPath}/user/logout">  <button
                                    class="btn btn-warning custom" type="button" data-toggle="collapse"
                                    data-target="#multiCollapseExample2" aria-expanded="false"
                                    aria-controls="multiCollapseExample2">Sign out</button></a></li>
                    </ul>

                </aside>
                <aside class="col-md-10 col-sm-10 col-xs-10 ">
                    <div class="jumbotron jumbotron-fluid bg-white pad-top">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-12 col-sm-12 col-xs-12">
                                    <div class="collapse multi-collapse" id="Map_context">
                                        <div class="card card-body border-color-navy rounded">
                                            <div id="map">
                                                <div class ="container" id="hotelsmap" style="height: 100vh"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-12 col-sm-12 col-xs-12">
                                    <div class="collapse multi-collapse" id="HotelList_context">

                                        <!--HOTEL LIST-->
                                        <table class="table table-responsive-lg table-lg table-bordered border-primary rounded table-hover">
                                            <thead class="text-center bg-primary">
                                                <tr>
                                                    <th class="text-center align-middle">Brand Name</th>
                                                    <th class="text-center align-middle">Address</th>
                                                    <th class="text-center align-middle">Postcode</th>
                                                    <th class="text-center align-middle">Stars</th>
                                                    <th class="text-center align-middle">Phone</th>
                                                    <th class="text-center align-middle">Email</th>
                                                    <th class="text-center align-middle">Website</th>

                                                </tr>
                                            </thead>
                                            <tbody class="text-center">
                                                <c:forEach items = "${hotels}" var = "hotel"> 
                                                    <tr>
                                                        <td class="text-center align-middle">${hotel.name}</td>
                                                        <td class="text-center align-middle">${hotel.address}</td>
                                                        <td class="text-center align-middle">${hotel.postcode}</td>
                                                        <td class="text-center align-middle">${hotel.starsnumber}</td>
                                                        <td class="text-center align-middle">${hotel.phone}</td>
                                                        <td class="text-center align-middle">${hotel.email}</td>
                                                        <td class="text-center align-middle">${hotel.siteurl}</td>

                                                    </tr>
                                                </c:forEach> 
                                            </tbody>
                                        </table>

                                    </div>
                                </div>
                                <div class="col-md-12 col-sm-12 col-xs-12">
                                    <div class="collapse multi-collapse" id="AddHotel_context">
                                        <div class="card card-body border-color-navy rounded">
                                            <!--ADD HOTEL - FORM-->
                                            <form:form class="form-signin" action="${pageContext.request.contextPath}/owner/addHotel" method="POST" modelAttribute="newhotel" > 

                                                <h1 class="h3 mb-3 font-weight-normal">Please information for new hotel
                                                </h1>
                                                <form:label path="name" >Brand Name
                                                </form:label>
                                                <form:input class="form-control mb-2" placeholder="Brand Name" required="true"
                                                            autofocus="true" path="name" />
                                                <form:label path="destinationid">Area
                                                </form:label>
                                                <form:select path="destinationid" class="browser-default custom-select mb-2">
                                                    <option selected>Area</option>
                                                    <c:forEach items = "${destinations}" var = "destinations"> 
                                                        <option value="${destinations.id}">${destinations.name}</option>
                                                    </c:forEach>                                                                                     
                                                </form:select>

                                                <form:label path="address">Address
                                                </form:label>
                                                <form:input class="form-control mb-2" id="route" placeholder="Address" required="true"
                                                            path="address" />
                                                <form:label path="postcode">Postcode
                                                </form:label>
                                                <form:input class="form-control mb-2" id="postal_code" placeholder="Postcode" required="true"
                                                            path="postcode" />
                                                <form:label path="starsnumber">Stars</form:label>
                                                <form:select path="starsnumber" class="browser-default custom-select mb-2">
                                                    <option selected>Number of Stars</option>
                                                    <option value="1">1 Star</option>
                                                    <option value="2">2 Stars</option>
                                                    <option value="3">3 Stars</option>
                                                    <option value="4">4 Stars</option>
                                                    <option value="5">5 Stars</option>                                                     
                                                </form:select>

                                                <form:label path="siteurl">URL
                                                </form:label>
                                                <form:input class="form-control mb-2" placeholder="URL" required="true"
                                                            path="siteurl" />
                                                <form:label path="phone">Phone
                                                </form:label>
                                                <form:input class="form-control mb-2" placeholder="Phone number" required="true"
                                                            path="phone" />
                                                <form:label path="email">Phone
                                                </form:label>
                                                <form:input class="form-control mb-2" placeholder="email" required="true"
                                                            path="email" />
                                                <form:label path="longtitude">Email
                                                </form:label>
                                                <form:input class="form-control mb-2" placeholder="longtitude" required="true"
                                                            path="longtitude" />
                                                <form:label path="latitude">Email
                                                </form:label>
                                                <form:input class="form-control mb-2" placeholder="latitude" required="true"
                                                            path="latitude" />


                                                <div class="form-group">
                                                    <form:label for="exampleFormControlTextarea1" path="description">Hotel Description</form:label>
                                                    <form:textarea path="description" class="form-control rounded-0" id="description" rows="10"></form:textarea>
                                                    </div>

                                                    <!--ADD HOTEL - CHECKBOXES -->

                                                    <div class="container">
                                                        <div class="row">
                                                            <div class="col-md-3 col-sm-3 col-xs-3">
                                                                <div class="custom-control custom-checkbox">
                                                                    <input type="checkbox" class="custom-control-input"
                                                                           id="Free Wifi" name="FreeWifi" />
                                                                    <label class="custom-control-label" for="Free Wifi" name="FreeWifi">Free Wifi</label>
                                                                </div>
                                                                <div class="custom-control custom-checkbox">
                                                                    <input type="checkbox" class="custom-control-input"
                                                                           id="Non-smoking room" name="Nonsmokingroom" />
                                                                    <label class="custom-control-label"
                                                                           for="Non-smoking room" name="Nonsmokingroom">Non-smoking room</label>
                                                                </div>

                                                            </div>
                                                            <div class="col-md-3 col-sm-3 col-xs-3">
                                                                <div class="custom-control custom-checkbox">
                                                                    <input type="checkbox" class="custom-control-input"
                                                                           id="Family Rooms" name="FamilyRooms" />
                                                                    <label class="custom-control-label"
                                                                           for="Family Rooms" name="FamilyRooms">Family Rooms</label>
                                                                </div>
                                                                <div class="custom-control custom-checkbox">
                                                                    <input type="checkbox" class="custom-control-input"
                                                                           id="Parking" name="Parking" />
                                                                    <label class="custom-control-label"
                                                                           for="Parking" name="Parking">Parking</label>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-3 col-sm-3 col-xs-3">
                                                                <div class="custom-control custom-checkbox">
                                                                    <input type="checkbox" class="custom-control-input"
                                                                           id="Pets allowed" name="Petsallowed" />
                                                                    <label class="custom-control-label" for="Pets allowed" name="Petsallowed">Pets
                                                                        allowed</label>
                                                                </div>
                                                                <div class="custom-control custom-checkbox">
                                                                    <input type="checkbox" class="custom-control-input"
                                                                           id="Swimming pool" name="Swimmingpool" />
                                                                    <label class="custom-control-label"
                                                                           for="Swimming pool" name="Swimmingpool">Swimming pool</label>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-3 col-sm-3 col-xs-3">

                                                                <div class="custom-control custom-checkbox">
                                                                    <input type="checkbox" class="custom-control-input"
                                                                           id="Spa and wellness center" name="Spaandwellnesscenter" />
                                                                    <label class="custom-control-label"
                                                                           for="Spa and wellness center" name="Spaandwellnesscenter">Spa and wellness
                                                                        center</label>
                                                                </div>
                                                                <div class="custom-control custom-checkbox">
                                                                    <input type="checkbox" class="custom-control-input"
                                                                           id="Bar" name="Bar" />
                                                                    <label class="custom-control-label" for="Bar" name="Bar">Bar</label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>





                                                    <button class="btn btn-lg btn-primary btn-block mt-2"
                                                            type="submit">Submit</button>
                                            </form:form> 

                                        </div>
                                    </div>
                                </div>

                                <!--UPDATE HOTEL-->

                                <div class="col-md-12 col-sm-12 col-xs-12">
                                    <div class="collapse multi-collapse" id="UpdateHotel_context">
                                        <div class="card card-body border-color-navy rounded">
                                            <form:form class="form-signin"
                                                       action="${pageContext.request.contextPath}/owner/updateHotel" method="POST"
                                                       modelAttribute="updatehotel"> 

                                                <h1 class="h3 mb-3 font-weight-normal">Update your hotel
                                                </h1>

                                                <form:label path="id">Choose Hotel
                                                </form:label>
                                                <form:select id="selectUH_hotel" class="browser-default custom-select mb-2" path="id">
                                                    <option selected>Select Hotel</option>
                                                    <c:forEach items = "${hotels}" var = "hotel"> 
                                                        <form:option value="${hotel.id}">${hotel.name}</form:option>
                                                    </c:forEach> 
                                                </form:select>
                                                <form:label path="name">Brand Name
                                                </form:label>
                                                <form:input class="form-control mb-2" id="nameUH" placeholder="Brand Name" required="true"
                                                            autofocus="true" path="name" />
                                                <form:label path="destinationid">Area
                                                </form:label>
                                                <form:select id="destinationUH" path="destinationid" class="browser-default custom-select mb-2">
                                                    <option>Area</option>
                                                    <c:forEach items = "${destinations}" var = "destinations"> 
                                                        <form:option class="optdestinationUH" value="${destinations.id}">${destinations.name}</form:option>
                                                    </c:forEach>                                                                                     
                                                </form:select>
                                                <form:label  path="address">Address
                                                </form:label>
                                                <form:input class="form-control mb-2" id="addressUH" placeholder="Address" required="true"
                                                            path="address" />
                                                <form:label  path="postcode">Postcode
                                                </form:label>
                                                <form:input class="form-control mb-2" id="postcodeUH" placeholder="Postcode" required="true"
                                                            path="postcode" />
                                                <form:label path="starsnumber">Stars
                                                </form:label>
                                                <form:select path="starsnumber" id="starsnumberUH" class="browser-default custom-select mb-2">
                                                    <option selected>Number of Stars</option>
                                                    <option id="UH1" value="1">1 Star</option>
                                                    <option id="UH2" value="2">2 Stars</option>
                                                    <option id="UH3" value="3">3 Stars</option>
                                                    <option id="UH4" value="4">4 Stars</option>
                                                    <option id="UH5" value="5">5 Stars</option>
                                                </form:select>

                                                <form:label path="siteurl">URL
                                                </form:label>
                                                <form:input class="form-control mb-2" id="urlUH" placeholder="URL" required="true"
                                                            path="siteurl" />
                                                <form:label path="phone">Phone
                                                </form:label>
                                                <form:input class="form-control mb-2" id="phoneUH" placeholder="Phone number" required="true"
                                                            path="phone" />
                                                <form:label path="email">Email
                                                </form:label>
                                                <form:input class="form-control mb-2"  id="emailUH" placeholder="emailUH" required="true"
                                                            path="email" />
                                                <form:label path="longtitude">longtitude
                                                </form:label>
                                                <form:input class="form-control mb-2"  id="longtitudeUH" placeholder="longtitudeUH" required="true"
                                                            path="longtitude" />
                                                <form:label path="latitude">Latitude
                                                </form:label>
                                                <form:input class="form-control mb-2" id="latitudeUH" placeholder="latitudeUH" required="true"
                                                            path="latitude" />

                                                <div class="form-group">
                                                    <form:label for="exampleFormControlTextarea1" path="description">Hotel Description</form:label>
                                                    <form:textarea id="descriptionUH" path="description" class="form-control rounded-0" rows="10"></form:textarea>
                                                    </div>

                                                    <!--UPDATE HOTEL - CHECHBOXES -->

                                                    <div class="container">
                                                        <div class="row">
                                                            <div class="col-md-3 col-sm-3 col-xs-3">
                                                                <div class="custom-control custom-checkbox">
                                                                    <input type="checkbox" class="custom-control-input"
                                                                           id="FreeWifiUH" name="FreeWifi" />
                                                                    <label class="custom-control-label" for="FreeWifiUH" name="FreeWifi">Free Wifi</label>
                                                                </div>
                                                                <div class="custom-control custom-checkbox">
                                                                    <input type="checkbox" class="custom-control-input"
                                                                           id="Non-smokingroomUH" name="Nonsmokingroom" />
                                                                    <label class="custom-control-label"
                                                                           for="Non-smokingroomUH" name="Nonsmokingroom">Non-smoking room</label>
                                                                </div>

                                                            </div>
                                                            <div class="col-md-3 col-sm-3 col-xs-3">
                                                                <div class="custom-control custom-checkbox">
                                                                    <input type="checkbox" class="custom-control-input"
                                                                           id="FamilyRoomsUH" name="FamilyRooms" />
                                                                    <label class="custom-control-label"
                                                                           for="FamilyRoomsUH" name="FamilyRooms">Family Rooms</label>
                                                                </div>
                                                                <div class="custom-control custom-checkbox">
                                                                    <input type="checkbox" class="custom-control-input"
                                                                           id="ParkingUH" name="Parking" />
                                                                    <label class="custom-control-label"
                                                                           for="ParkingUH" name="Parking">Parking</label>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-3 col-sm-3 col-xs-3">
                                                                <div class="custom-control custom-checkbox">
                                                                    <input type="checkbox" class="custom-control-input"
                                                                           id="PetsallowedUH" name="Petsallowed" />
                                                                    <label class="custom-control-label" for="PetsallowedUH" name="Petsallowed">Pets
                                                                        allowed</label>
                                                                </div>
                                                                <div class="custom-control custom-checkbox">
                                                                    <input type="checkbox" class="custom-control-input"
                                                                           id="SwimmingpoolUH" name="Swimmingpool" />
                                                                    <label class="custom-control-label"
                                                                           for="SwimmingpoolUH" name="Swimmingpool">Swimming pool</label>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-3 col-sm-3 col-xs-3">

                                                                <div class="custom-control custom-checkbox">
                                                                    <input type="checkbox" class="custom-control-input"
                                                                           id="SpaandwellnesscenterUH" name="Spaandwellnesscenter" />
                                                                    <label class="custom-control-label"
                                                                           for="SpaandwellnesscenterUH" name="Spaandwellnesscenter">Spa and wellness
                                                                        center</label>
                                                                </div>
                                                                <div class="custom-control custom-checkbox">
                                                                    <input type="checkbox" class="custom-control-input"
                                                                           id="BarUH" name="Bar" />
                                                                    <label class="custom-control-label" for="BarUH" name="Bar">Bar</label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <button class="btn btn-lg btn-primary btn-block mt-2"
                                                            type="submit">Update</button>


                                            </form:form> 
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-12 col-sm-12 col-xs-12">
                                    <div class="collapse multi-collapse" id="AddRoom_context">
                                        <div class="card card-body border-color-navy rounded">

                                            <!--ADD ROOM -->

                                            <form:form class="form-signin"
                                                       action="${pageContext.request.contextPath}/owner/addRoom" method="POST"
                                                       modelAttribute="newroom"> 

                                                <h1 class="h3 mb-3 font-weight-normal">Add your Room
                                                </h1>
                                                <form:label path="hotelid">Choose Hotel
                                                </form:label>
                                                <form:select path="hotelid" class="browser-default custom-select mb-2">
                                                    <option selected>Select Hotel</option>
                                                    <c:forEach items = "${hotels}" var = "hotel"> 
                                                        <form:option value="${hotel.id}">${hotel.name}</form:option>
                                                    </c:forEach> 
                                                </form:select>
                                                <form:label path="name">Room Name
                                                </form:label>
                                                <form:input class="form-control mb-2" placeholder="Room Name" required="true"
                                                            autofocus="true" path="name" />
                                                <form:label path="capacity">Capacity
                                                </form:label>
                                                <form:input class="form-control mb-2" placeholder="Max Capacity" required="true"
                                                            autofocus="true" path="capacity" />
                                                <form:label path="pricepernight">Price per night
                                                </form:label>
                                                <form:input class="form-control mb-2" placeholder="Price per night"
                                                            required="true" path="pricepernight" />
                                                <form:label path="description">Description
                                                </form:label>
                                                <form:input class="form-control mb-2" placeholder="Description"
                                                            required="true" path="description" />



                                                <div class="container">
                                                    <div class="row">
                                                        <div class="col-md-3 col-sm-3 col-xs-3">
                                                            <div class="custom-control custom-checkbox">
                                                                <input type="checkbox" class="custom-control-input"
                                                                       id="Kitchen" name="Kitchen" >
                                                                <label class="custom-control-label"
                                                                       for="Kitchen">Kitchen</label>
                                                            </div>
                                                            <div class="custom-control custom-checkbox">
                                                                <input type="checkbox" class="custom-control-input"
                                                                       id="Private bathroom" name="Privatebathroom" >
                                                                <label class="custom-control-label"
                                                                       for="Private bathroom">Private bathroom</label>
                                                            </div>
                                                            <div class="custom-control custom-checkbox">
                                                                <input type="checkbox" class="custom-control-input"
                                                                       id="Air conditioning" name="AirConditioning" >
                                                                <label class="custom-control-label"
                                                                       for="Air conditioning">Air conditioning</label>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-3 col-sm-3 col-xs-3">
                                                            <div class="custom-control custom-checkbox">
                                                                <input type="checkbox" class="custom-control-input"
                                                                       id="Bath" name="Bath" >
                                                                <label class="custom-control-label" for="Bath">Bath</label>
                                                            </div>
                                                            <div class="custom-control custom-checkbox">
                                                                <input type="checkbox" class="custom-control-input"
                                                                       id="Flat-screen TV" name="FlatscreenTV" >
                                                                <label class="custom-control-label"
                                                                       for="Flat-screen TV">Flat-screen TV</label>
                                                            </div>
                                                            <div class="custom-control custom-checkbox">
                                                                <input type="checkbox" class="custom-control-input"
                                                                       id="Washing Machine" name="WashingMachine" >
                                                                <label class="custom-control-label"
                                                                       for="Washing Machine">Washing Machine</label>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-3 col-sm-3 col-xs-3">
                                                            <div class="custom-control custom-checkbox">
                                                                <input type="checkbox" class="custom-control-input"
                                                                       id="View" name="View" >
                                                                <label class="custom-control-label" for="View">View</label>
                                                            </div>
                                                            <div class="custom-control custom-checkbox">
                                                                <input type="checkbox" class="custom-control-input"
                                                                       id="Coffee/tea maker" name="CoffeeteaMaker" >
                                                                <label class="custom-control-label"
                                                                       for="Coffee/tea maker">Coffee/tea maker</label>
                                                            </div>
                                                            <div class="custom-control custom-checkbox">
                                                                <input type="checkbox" class="custom-control-input"
                                                                       id="Coffee machine" name="CoffeeMachine" >
                                                                <label class="custom-control-label"
                                                                       for="Coffee machine">Coffee machine</label>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-3 col-sm-3 col-xs-3">

                                                            <div class="custom-control custom-checkbox">
                                                                <input type="checkbox" class="custom-control-input"
                                                                       id="Electric kettle" name="Electrickettle" >
                                                                <label class="custom-control-label"
                                                                       for="Electric kettle">Electric kettle</label>
                                                            </div>
                                                            <div class="custom-control custom-checkbox">
                                                                <input type="checkbox" class="custom-control-input"
                                                                       id="Double bed" name="DoubleBed" >
                                                                <label class="custom-control-label" for="Double bed">Double
                                                                    bed</label>
                                                            </div>
                                                            <div class="custom-control custom-checkbox">
                                                                <input type="checkbox" class="custom-control-input"
                                                                       id="Single Bed" name="SingleBed" >
                                                                <label class="custom-control-label" for="Single Bed">Single
                                                                    Bed</label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <button class="btn btn-lg btn-primary btn-block mt-2"
                                                        type="submit">Submit</button>

                                            </form:form> 
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-12 col-sm-12 col-xs-12">
                                    <div class="collapse multi-collapse" id="UpdateRoom_context">
                                        <div class="card card-body border-color-navy rounded">
                                            <!--UPDATE ROOM -->

                                            <form:form class="form-signin"
                                                       action="${pageContext.request.contextPath}/owner/updateRoom" method="POST"
                                                       modelAttribute="updateroom"> 

                                                <h1 class="h3 mb-3 font-weight-normal">Update your Room
                                                </h1>

                                                <form:label  path="hotelid">Choose Hotel
                                                </form:label>
                                                <form:select id="hotelidsel" path="hotelid" class="browser-default custom-select mb-2">
                                                    <option selected>Select Hotel</option>
                                                    <c:forEach items = "${hotels}" var = "hotel"> 
                                                        <form:option value="${hotel.id}">${hotel.name}</form:option>
                                                    </c:forEach> 
                                                </form:select>
                                                <form:label  path="Id">Choose Room
                                                </form:label>
                                                <form:select id="roomidsel" path="Id" class="browser-default custom-select mb-2">
                                                    <option selected>Select Room</option>
                                                    <c:forEach items = "${rooms}" var = "rooms"> 
                                                        <form:option value="${rooms.id}">${rooms.description}-${rooms.name}</form:option>
                                                    </c:forEach> 
                                                </form:select>

                                                <form:label  path="name">Max Capacity
                                                </form:label>
                                                <form:input class="form-control mb-2" id="RoomName" placeholder="Room Name" required="true"
                                                            autofocus="true" path="name" />

                                                <form:label path="capacity">Capacity
                                                </form:label>
                                                <form:input class="form-control mb-2" id="MaxCapacity" placeholder="Max Capacity" required="true"
                                                            autofocus="true" path="capacity" />
                                                <form:label path="pricepernight">Price per night
                                                </form:label>
                                                <form:input class="form-control mb-2" id="Price" placeholder="Price per night"
                                                            required="true" path="pricepernight" />
                                                <form:label path="description">Description
                                                </form:label>
                                                <form:input class="form-control mb-2" id="descriptionUR" placeholder="Description"
                                                            required="true" path="description" />

                                                <div class="container">
                                                    <div class="row">
                                                        <div class="col-md-3 col-sm-3 col-xs-3">
                                                            <div class="custom-control custom-checkbox">
                                                                <input type="checkbox" class="custom-control-input"
                                                                       id="KitchenUR" name="Kitchen" >
                                                                <label class="custom-control-label"
                                                                       for="KitchenUR">Kitchen</label>
                                                            </div>
                                                            <div class="custom-control custom-checkbox">
                                                                <input type="checkbox" class="custom-control-input"
                                                                       id="PrivatebathroomUR" name="Privatebathroom" >
                                                                <label class="custom-control-label"
                                                                       for="PrivatebathroomUR">Private bathroom</label>
                                                            </div>
                                                            <div class="custom-control custom-checkbox">
                                                                <input type="checkbox" class="custom-control-input"
                                                                       id="AirconditioningUR" name="AirConditioning" >
                                                                <label class="custom-control-label"
                                                                       for="AirconditioningUR">Air conditioning</label>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-3 col-sm-3 col-xs-3">
                                                            <div class="custom-control custom-checkbox">
                                                                <input type="checkbox" class="custom-control-input"
                                                                       id="BathUR" name="Bath" >
                                                                <label class="custom-control-label" for="BathUR">Bath</label>
                                                            </div>
                                                            <div class="custom-control custom-checkbox">
                                                                <input type="checkbox" class="custom-control-input"
                                                                       id="FlatscreenTVUR" name="FlatscreenTV" >
                                                                <label class="custom-control-label"
                                                                       for="FlatscreenTVUR">Flat-screen TV</label>
                                                            </div>
                                                            <div class="custom-control custom-checkbox">
                                                                <input type="checkbox" class="custom-control-input"
                                                                       id="WashingMachineUR" name="WashingMachine" >
                                                                <label class="custom-control-label"
                                                                       for="WashingMachineUR">Washing Machine</label>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-3 col-sm-3 col-xs-3">
                                                            <div class="custom-control custom-checkbox">
                                                                <input type="checkbox" class="custom-control-input"
                                                                       id="ViewUR" name="View" >
                                                                <label class="custom-control-label" for="ViewUR">View</label>
                                                            </div>
                                                            <div class="custom-control custom-checkbox">
                                                                <input type="checkbox" class="custom-control-input"
                                                                       id="CoffeeteamakerUR" name="CoffeeteaMaker" >
                                                                <label class="custom-control-label"
                                                                       for="CoffeeteamakerUR">Coffee/tea maker</label>
                                                            </div>
                                                            <div class="custom-control custom-checkbox">
                                                                <input type="checkbox" class="custom-control-input"
                                                                       id="CoffeemachineUR" name="CoffeeMachine" >
                                                                <label class="custom-control-label"
                                                                       for="CoffeemachineUR">Coffee machine</label>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-3 col-sm-3 col-xs-3">

                                                            <div class="custom-control custom-checkbox">
                                                                <input type="checkbox" class="custom-control-input"
                                                                       id="ElectrickettleUR" name="Electrickettle" >
                                                                <label class="custom-control-label"
                                                                       for="ElectrickettleUR">Electric kettle</label>
                                                            </div>
                                                            <div class="custom-control custom-checkbox">
                                                                <input type="checkbox" class="custom-control-input"
                                                                       id="DoublebedUR" name="DoubleBed" >
                                                                <label class="custom-control-label" for="DoublebedUR">Double
                                                                    bed</label>
                                                            </div>
                                                            <div class="custom-control custom-checkbox">
                                                                <input type="checkbox" class="custom-control-input"
                                                                       id="SingleBedUR" name="SingleBed" >
                                                                <label class="custom-control-label" for="SingleBedUR">Single
                                                                    Bed</label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <button class="btn btn-lg btn-primary btn-block mt-2"
                                                        type="submit">Update</button>
                                            </form:form> 
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-12 col-sm-12 col-xs-12">
                                <div class="collapse multi-collapse" id="Settings_context">
                                    <div class="card card-body border-color-navy rounded">
                                        <form:form class="form-signin"
                                                   action="${pageContext.request.contextPath}/owner/updateOwnerSettings" method="POST"
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

                                            <button class="btn btn-lg btn-primary btn-block mt-2"
                                                    type="submit">Submit</button>

                                        </form:form> 
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-12 col-sm-12 col-xs-12">
                                <div class="collapse multi-collapse" id="DeclareUnavailability_context">
                                    <div class="card card-body border-color-navy rounded">

                                        <!--DECLARE UNAVAILABILITY-->

                                        <form:form class="form-signin"
                                                   action="${pageContext.request.contextPath}/owner/unavailability" method="POST"
                                                   modelAttribute="roomUnavailability"> 

                                            <h1 class="h3 mb-3 font-weight-normal">Declare Room Unavailability
                                            </h1>


                                            <form:label path="hotelid">Choose Hotel
                                            </form:label>
                                            <form:select id="hotelidselDU" path="hotelid" class="browser-default custom-select mb-2">
                                                <option selected>Select Hotel</option>
                                                <c:forEach items = "${hotels}" var = "hotel"> 
                                                    <form:option value="${hotel.id}">${hotel.name}</form:option>
                                                </c:forEach> 
                                            </form:select>
                                            <form:label path="roomid">Choose Room
                                            </form:label>
                                            <form:select id="roomidselDU" path="roomid" class="browser-default custom-select mb-2">
                                                <option selected>Select Room</option>
                                                <c:forEach items = "${rooms}" var = "rooms"> 
                                                    <form:option value="${rooms.id}" >${rooms.description}-${rooms.name}</form:option>
                                                </c:forEach> 
                                            </form:select>
                                            <form:label path="startdate">Date from</form:label>
                                            <form:input type="date" id="datepicker" class="form-control mb-2" placeholder="Start Date"
                                                        required="true" autofocus="true" path="startdate" />
                                            <form:label path="enddate">Date to</form:label>
                                            <form:input type="date" id="datepicker"  class="form-control mb-2" placeholder="End Date"
                                                        required="true" autofocus="true" path="enddate" />
                                            <form:label path="status">Stars</form:label>
                                            <form:select path="status" class="browser-default custom-select mb-2">
                                                <option selected>Status</option>
                                                <option value="2">Unavailable</option>
                                                <option value="1">Reserved</option>                                                                                                           
                                            </form:select>

                                            <button class="btn btn-lg btn-primary btn-block mt-2"
                                                    type="submit">Submit</button>

                                        </form:form> 
                                    </div>
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
        myMap();
        $('#Map_context').show();
    };
    $('#btnmap').click(function () {
        $('#Map_context').show();
        $('#HotelList_context').hide();
        $('#UpdateHotel_context').hide();
        $('#AddRoom_context').hide();
        $('#UpdateRoom_context').hide();
        $('#DeclareUnavailability_context').hide();
        $('#Settings_context').hide();
        $('#AddHotel_context').hide();
    });
    $('#btn0').click(function () {
        $('#Map_context').hide();
        $('#HotelList_context').show();
        $('#UpdateHotel_context').hide();
        $('#AddRoom_context').hide();
        $('#UpdateRoom_context').hide();
        $('#DeclareUnavailability_context').hide();
        $('#Settings_context').hide();
        $('#AddHotel_context').hide();
    });
    $('#btn1').click(function () {
        $('#Map_context').hide();
        $('#HotelList_context').hide();
        $('#UpdateHotel_context').hide();
        $('#AddRoom_context').hide();
        $('#UpdateRoom_context').hide();
        $('#DeclareUnavailability_context').hide();
        $('#Settings_context').hide();
        $('#AddHotel_context').show();
    });
    $('#btn2').click(function () {
        $('#Map_context').hide();
        $('#HotelList_context').hide();
        $('#AddHotel_context').hide();
        $('#UpdateHotel_context').show();
        $('#AddRoom_context').hide();
        $('#UpdateRoom_context').hide();
        $('#DeclareUnavailability_context').hide();
        $('#Settings_context').hide();
    });
    $('#btn3').click(function () {
        $('#Map_context').hide();
        $('#HotelList_context').hide();
        $('#AddHotel_context').hide();
        $('#UpdateHotel_context').hide();
        $('#AddRoom_context').show();
        $('#UpdateRoom_context').hide();
        $('#DeclareUnavailability_context').hide();
        $('#Settings_context').hide();
    });
    $('#btn4').click(function () {
        $('#Map_context').hide();
        $('#HotelList_context').hide();
        $('#AddHotel_context').hide();
        $('#UpdateHotel_context').hide();
        $('#AddRoom_context').hide();
        $('#UpdateRoom_context').show();
        $('#DeclareUnavailability_context').hide();
        $('#Settings_context').hide();
    });
    $('#btn5').click(function () {
        $('#Map_context').hide();
        $('#HotelList_context').hide();
        $('#AddHotel_context').hide();
        $('#UpdateHotel_context').hide();
        $('#AddRoom_context').hide();
        $('#UpdateRoom_context').hide();
        $('#DeclareUnavailability_context').show();
        $('#Settings_context').hide();
    });
    $('#btn6').click(function () {
        $('#Map_context').hide();
        $('#HotelList_context').hide();
        $('#AddHotel_context').hide();
        $('#UpdateHotel_context').hide();
        $('#AddRoom_context').hide();
        $('#UpdateRoom_context').hide();
        $('#DeclareUnavailability_context').hide();
        $('#Settings_context').show();
    });
    var nameUH = document.getElementById("nameUH");
    var hotelnamesel = document.getElementById("selectUH_hotel");
    var hotelnameselid = document.getElementById("idhotel");
    var destinationUH = document.getElementById("destinationUH");
    var addressUH = document.getElementById("addressUH");
    var postcodeUH = document.getElementById("postcodeUH");
    var urlUH = document.getElementById("urlUH");
    var phoneUH = document.getElementById("phoneUH");
    var emailUH = document.getElementById("emailUH");
    var longtitudeUH = document.getElementById("longtitudeUH");
    var latitudeUH = document.getElementById("latitudeUH");
    var descriptionUH = document.getElementById("descriptionUH");
    var starsnumberUH = document.getElementById("starsnumberUH");
//                                    
    var roomidsel = document.getElementById("roomidsel");
    var hotelidsel = document.getElementById("hotelidsel");
    var RoomName = document.getElementById("RoomName");
    var MaxCapacity = document.getElementById("MaxCapacity");
    var Price = document.getElementById("Price");
    var descriptionUR = document.getElementById("descriptionUR");

    var roomidselDU = document.getElementById("roomidselDU");
    var hotelidselDU = document.getElementById("hotelidselDU");
    document.querySelector("#selectUH_hotel").addEventListener("click", function () {
        updatehotel();
    });
    function updatehotel() {
    <c:forEach items = "${hotels}" var = "hotel">
        if (hotelnamesel.value == "${hotel.id}") {
            nameUH.value = "${hotel.name}";
            destinationUH.value = "${hotel.destinationid.id}";
            console.log("${hotel.destinationid}");
            addressUH.value = "${hotel.address}";
            postcodeUH.value = "${hotel.postcode}";
            urlUH.value = "${hotel.siteurl}";
            phoneUH.value = "${hotel.phone}";
            emailUH.value = "${hotel.email}";
            longtitudeUH.value = "${hotel.longtitude}";
            latitudeUH.value = "${hotel.latitude}";
            descriptionUH.value = "${hotel.description}";
            starsnumberUH.value = "${hotel.starsnumber}";

            document.getElementById("FreeWifiUH").checked = false;
            document.getElementById("Non-smokingroomUH").checked = false;
            document.getElementById("FamilyRoomsUH").checked = false;
            document.getElementById("ParkingUH").checked = false;
            document.getElementById("PetsallowedUH").checked = false;
            document.getElementById("SwimmingpoolUH").checked = false;
            document.getElementById("SpaandwellnesscenterUH").checked = false;
            document.getElementById("BarUH").checked = false;
        <c:forEach items = "${hotelFacilities}" var = "hotelFacilities">
            if ("${hotelFacilities.hotel.id}" == hotelnamesel.value) {
                if ("${hotelFacilities.facilities.id}" == 1) {
                    document.getElementById("FreeWifiUH").checked = true;
                }
                if ("${hotelFacilities.facilities.id}" == 2) {
                    document.getElementById("Non-smokingroomUH").checked = true;
                }
                if ("${hotelFacilities.facilities.id}" == 3) {
                    document.getElementById("FamilyRoomsUH").checked = true;
                }
                if ("${hotelFacilities.facilities.id}" == 5) {
                    document.getElementById("ParkingUH").checked = true;
                }
                if ("${hotelFacilities.facilities.id}" == 6) {
                    document.getElementById("PetsallowedUH").checked = true;
                }
                if ("${hotelFacilities.facilities.id}" == 8) {
                    document.getElementById("SwimmingpoolUH").checked = true;
                }
                if ("${hotelFacilities.facilities.id}" == 9) {
                    document.getElementById("SpaandwellnesscenterUH").checked = true;
                }
                if ("${hotelFacilities.facilities.id}" == 10) {
                    document.getElementById("BarUH").checked = true;
                }
            }
        </c:forEach>
        }
    </c:forEach>
    }
    ;
    document.querySelector("#roomidsel").addEventListener("change", function () {
        updateroom();
    });
    document.querySelector("#hotelidsel").addEventListener("change", function () {
        updateroomnames();
    });
    document.querySelector("#hotelidselDU").addEventListener("change", function () {
        updateroomnamesunavailability();
    });
    function updateroomnamesunavailability() {
        for (var i = 0; i < roomidselDU.length; i++) {
            roomidselDU.options[i].style.display = "block";
        }
    <c:forEach items = "${rooms}" var = "room">
        if (("${room.hotelid.id}") != hotelidselDU.value) {
            for (var i = 0; i < roomidsel.length; i++) {
                if (roomidselDU.options[i].value == "${room.id}") {
                    roomidselDU.options[i].style.display = "none";
                }
            }
        }
    </c:forEach>
    }
    ;
    function updateroomnames() {
        for (var i = 0; i < roomidsel.length; i++) {
            roomidsel.options[i].style.display = "block";
        }
        RoomName.value = " ";
        MaxCapacity.value = " ";
        Price.value = " ";
        descriptionUR.value = " ";
        roomidsel.value = " ";
        document.getElementById("KitchenUR").checked = false;
        document.getElementById("PrivatebathroomUR").checked = false;
        document.getElementById("AirconditioningUR").checked = false;
        document.getElementById("BathUR").checked = false;
        document.getElementById("FlatscreenTVUR").checked = false;
        document.getElementById("WashingMachineUR").checked = false;
        document.getElementById("ViewUR").checked = false;
        document.getElementById("CoffeeteamakerUR").checked = false;
        document.getElementById("CoffeemachineUR").checked = false;
        document.getElementById("ElectrickettleUR").checked = false;
        document.getElementById("DoublebedUR").checked = false;
        document.getElementById("SingleBedUR").checked = false;
    <c:forEach items = "${rooms}" var = "room">
        if (("${room.hotelid.id}") != hotelidsel.value) {
            for (var i = 0; i < roomidsel.length; i++) {
                if (roomidsel.options[i].value == "${room.id}") {
                    roomidsel.options[i].style.display = "none";
                }
            }
        }
    </c:forEach>
    }
    ;
    function updateroom() {
    <c:forEach items = "${rooms}" var = "room">
        if (roomidsel.value == "${room.id}") {
            RoomName.value = "${room.name}";
            MaxCapacity.value = "${room.capacity}";
            Price.value = "${room.pricepernight}";
            descriptionUR.value = "${room.description}";

            document.getElementById("KitchenUR").checked = false;
            document.getElementById("PrivatebathroomUR").checked = false;
            document.getElementById("AirconditioningUR").checked = false;
            document.getElementById("BathUR").checked = false;
            document.getElementById("FlatscreenTVUR").checked = false;
            document.getElementById("WashingMachineUR").checked = false;
            document.getElementById("ViewUR").checked = false;
            document.getElementById("CoffeeteamakerUR").checked = false;
            document.getElementById("CoffeemachineUR").checked = false;
            document.getElementById("ElectrickettleUR").checked = false;
            document.getElementById("DoublebedUR").checked = false;
            document.getElementById("SingleBedUR").checked = false;
        <c:forEach items = "${roomEquipments}" var = "roomEquipments">
            if ("${roomEquipments.room.id}" == roomidsel.value) {
                if ("${roomEquipments.equipment.id}" == 1) {
                    document.getElementById("KitchenUR").checked = true;
                }
                if ("${roomEquipments.equipment.id}" == 2) {
                    document.getElementById("PrivatebathroomUR").checked = true;
                }
                if ("${roomEquipments.equipment.id}" == 3) {
                    document.getElementById("AirconditioningUR").checked = true;
                }
                if ("${roomEquipments.equipment.id}" == 4) {
                    document.getElementById("BathUR").checked = true;
                }
                if ("${roomEquipments.equipment.id}" == 5) {
                    document.getElementById("FlatscreenTVUR").checked = true;
                }
                if ("${roomEquipments.equipment.id}" == 6) {
                    document.getElementById("WashingMachineUR").checked = true;
                }
                if ("${roomEquipments.equipment.id}" == 7) {
                    document.getElementById("ViewUR").checked = true;
                }
                if ("${roomEquipments.equipment.id}" == 8) {
                    document.getElementById("CoffeeteamakerUR").checked = true;
                }
                if ("${roomEquipments.equipment.id}" == 9) {
                    document.getElementById("CoffeemachineUR").checked = true;
                }
                if ("${roomEquipments.equipment.id}" == 10) {
                    document.getElementById("ElectrickettleUR").checked = true;
                }
                if ("${roomEquipments.equipment.id}" == 11) {
                    document.getElementById("DoublebedUR").checked = true;
                }
                if ("${roomEquipments.equipment.id}" == 12) {
                    document.getElementById("SingleBedUR").checked = true;
                }
            }
        </c:forEach>
        }
    </c:forEach>
    }
    ;
    document.querySelector("#btnmap").addEventListener("click", function () {
        myMap();
    });
    function myMap() {
        var options = {zoom: 6, center: {lat: 37.9838, lng: 23.7275}
        }
        var map = new google.maps.Map(document.getElementById('map'), options);
    <c:forEach items = "${hotels}" var = "hotel">
        addMarker({coords: {lat:${hotel.longtitude}, lng:${hotel.latitude}},
            content: '<h1>${hotel.name}</h1>'
        });
    </c:forEach>
        function addMarker(props) {
            var marker = new google.maps.Marker({
                position: props.coords,
                map: map
            });
            if (props.content) {
                var infoWindow = new google.maps.InfoWindow({
                    content: props.content
                });
                marker.addListener('click', function () {
                    infoWindow.open(map, marker);
                });
            }
        }
    }
    ;

</script>

</body>

</html>