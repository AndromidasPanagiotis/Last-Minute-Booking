<%-- 
    Document   : search_central
    Created on : 13 ???? 2019, 3:06:04 ??
    Author     : minas
--%>

<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en" >

    <head>

        <!-- Bootstrap core CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

        <link rel="stylesheet" type="text/css" href="../resources/css/search_central.css">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Available Hotels</title>
        <link rel="stylecentral" href="styles.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lobster&effect=brick-sign">
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" >
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script async defer
                src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAlS-KpnNtyHZr2UWKRzF7WNKevSqRLDP4&callback=initMap">
        </script>
        <script src="https://code.jquery.com/jquery-3.4.0.min.js"
        integrity="sha256-BJeo0qm959uMBGb65z40ejJYGSgR7REI4+CW1fNKwOg=" crossorigin="anonymous"></script>
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
            <a class="navbar-brand"><img src='../resources/media/logo120x60.svg'></a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                    aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav  ml-auto">
                    <li class="nav-item">
                        <a id="home_link" class="nav-link rounded" href="${pageContext.request.contextPath}/user/customerCentral" tabindex="-1" aria-disabled="true">Home</a>
                    </li>
                </ul>
                <form class="form-inline my-2 my-lg-0">
                    <ul id="dropdown_customer" class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle text-white" href="#" id="navbarDropdown" role="button"
                           data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Welcome, ${sessionScope.loggedUser.name} ${sessionScope.loggedUser.surname}
                        </a>
                        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="${pageContext.request.contextPath}/user/customer_services">Services</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="${pageContext.request.contextPath}/user/logout">Sign out</a>
                        </div>
                    </ul>
                </form>
            </div>
        </nav>



        <div class="container">
            <div class="row">
                <aside class="col-md-12 col-sm-12 col-xs-12">

                    <!--SEARCH BOX-->
                    <div id="Search_box" class="container">
                        <div id="Search_box_inside" class="jumbotron jumbotron-fluid bg-white rounded border-color-navy shadow">

                            <label id="Search_text" class="control-label  w3-lobster w3-xxxlarge">
                                <h1>Search</h1>
                            </label>

                            <div class="container w3-lobster w3-xlarge ">
                                <form action = "${pageContext.request.contextPath}/user/search" method="post">
                                    <div class="row">
                                        <div class="col-md-12 col-sm-12 col-xs-12">
                                            <div class="row">
                                                <div class="col-md-2 col-sm-2 col-xs-2">
                                                    <div class="form-group ">
                                                        <label class="control-label" for="budget">
                                                            Total Budget
                                                        </label>
                                                        <input class="form-control" id="budget" name="budget" type="text" value="${budget}" />
                                                    </div>
                                                </div>
                                                <div class="col-md-2 col-sm-2 col-xs-2">
                                                    <div class="form-group ">
                                                        <label class="control-label" for="persons">
                                                            Number of persons
                                                        </label>
                                                        <input class="form-control" id="persons" name="persons" type="text" value="${persons}" />
                                                    </div>
                                                </div>
                                                <div class="col-md-3 col-sm-3 col-xs-3">
                                                    <div class="form-group ">
                                                        <label class="control-label" for="checkin">
                                                            Check in
                                                        </label>
                                                        <input class="form-control" id="date" name="checkin" type="date" value="${checkinS}" />
                                                    </div>
                                                </div>
                                                <div class="col-md-3 col-sm-3 col-xs-3">
                                                    <div class="form-group ">
                                                        <label class="control-label" for="checkout">
                                                            Check out
                                                        </label>
                                                        <input class="form-control" id="date" name="checkout" type="date" value="${checkoutS}" />
                                                    </div>
                                                </div>
                                                <div class="col-md-2 col-sm-2 col-xs-2">
                                                    <div id="button_search" class="form-group ">
                                                        <button class="btn btn-lg bg-navy text-white w3-lobster w3-xlarge " id="Search" name="Search" type="submit" >
                                                            &nbsp;&nbsp;&nbsp;Search&nbsp;&nbsp;&nbsp;
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <aside class="col-md-3 col-sm-3 col-xs-3">

                            <!-- Trigger/Open The Modal -->

                            <h6 class="title text-white"> <button class="btn btn-warning btn-lg btn-block" type="button" id="myBtn">Show hotels on Map</button></h6>



                            <!-- The Modal -->
                            <div id="myModal" class="modal">
                                <!-- Modal content -->
                                <div class="modal-content">
                                    <span class="close" style="close">&times;</span>
                                    <div id="map">
                                        <div class ="container" id="hotelsmap" style="height: 100vh"></div>
                                    </div>
                                </div>
                            </div>

                            <div class="card">
                                <article class="card-group-item">
                                    <header class="card-header bg-navy">
                                        <h6 class="title text-white">Star Rating </h6>
                                    </header>
                                    <div class="filter-content">
                                        <div class="card-body">
                                            <form>
                                                <label class="form-check">
                                                    <input class="form-check-input" type="checkbox" value="1" id="1star">
                                                    <span class="form-check-label">
                                                        1 Star
                                                    </span>
                                                </label> 
                                                <label class="form-check">
                                                    <input class="form-check-input" type="checkbox" value="2" id="2star">
                                                    <span class="form-check-label">
                                                        2 Star
                                                    </span>
                                                </label> 
                                                <label class="form-check">
                                                    <input class="form-check-input" type="checkbox" value="3" id="3star">
                                                    <span class="form-check-label">
                                                        3 Star
                                                    </span>
                                                </label>
                                                <label class="form-check">
                                                    <input class="form-check-input" type="checkbox" value="4" id="4star">
                                                    <span class="form-check-label">
                                                        4 Star
                                                    </span>
                                                </label>
                                                <label class="form-check">
                                                    <input class="form-check-input" type="checkbox" value="5" id="5star">
                                                    <span class="form-check-label">
                                                        5 Star
                                                    </span>
                                                </label>
                                                </label> 
                                            </form>
                                        </div> 
                                    </div>
                                </article> 

                                <article class="card-group-item">
                                    <header class="card-header bg-navy">
                                        <h6 class="title text-white">Hotel Facilities </h6>
                                    </header>
                                    <div class="filter-content">
                                        <div class="card-body">
                                            <form>
                                                <label class="form-check">
                                                    <input class="form-check-input" type="checkbox" value="" id="wifi">
                                                    <span class="form-check-label">
                                                        Free WiFi
                                                    </span>
                                                </label> 
                                                <label class="form-check">
                                                    <input class="form-check-input" type="checkbox" value="" id="smoke">
                                                    <span class="form-check-label">
                                                        Non-smoking rooms
                                                    </span>
                                                </label> 
                                                <label class="form-check">
                                                    <input class="form-check-input" type="checkbox" value="" id="family">
                                                    <span class="form-check-label">
                                                        Family rooms
                                                    </span>
                                                </label>
                                                <label class="form-check">
                                                    <input class="form-check-input" type="checkbox" value="" id="airport">
                                                    <span class="form-check-label">
                                                        Airport shuttle
                                                    </span>
                                                </label>
                                                <label class="form-check">
                                                    <input class="form-check-input" type="checkbox" value="" id="parking">
                                                    <span class="form-check-label">
                                                        Parking
                                                    </span>
                                                </label>
                                                <label class="form-check">
                                                    <input class="form-check-input" type="checkbox" value="" id="pets">
                                                    <span class="form-check-label">
                                                        Pets allowed
                                                    </span>
                                                </label>
                                                <label class="form-check">
                                                    <input class="form-check-input" type="checkbox" value="" id="room">
                                                    <span class="form-check-label">
                                                        Room service
                                                    </span>
                                                </label>
                                                <label class="form-check">
                                                    <input class="form-check-input" type="checkbox" value="" id="pool">
                                                    <span class="form-check-label">
                                                        Swimming pool
                                                    </span>
                                                </label>
                                                <label class="form-check">
                                                    <input class="form-check-input" type="checkbox" value="" id="spa">
                                                    <span class="form-check-label">
                                                        Spa and wellness centre
                                                    </span>
                                                </label>
                                                <label class="form-check">
                                                    <input class="form-check-input" type="checkbox" value="" id="bar">
                                                    <span class="form-check-label">
                                                        Bar
                                                    </span>
                                                </label>
                                            </form>
                                        </div>
                                </article> 



                                <button class="btn bg-danger text-white " id="reset">
                                    Reset filters
                                </button>


                            </div> 
                        </aside>


                        <aside class="col-md-9 col-sm-9 col-xs-9" id="myrow">


                        </aside>
                    </div>
            </div>
        </div>

        <script>
            jQuery(init);

            function init($) {
                $(document).ready(getHotels);
                let searchHotels;
                let lastFilteredResult;
                let myrow = $("#myrow");

                function getHotels() {
                    let URL = "http://localhost:8080/lmb/user/search/ajax";
                    $.ajax({
                        url: URL,
                        success: getUserSearchHotels,
                        error: handleError
                    });

                    function handleError(jqXHR, testStatus, errorThrown) {
                        console.log(testStatus, errorThrown);
                    }

                    function getUserSearchHotels(data) {
                        searchHotels = JSON.parse(JSON.stringify(data)); // Deep object copy
                        lastFilteredResult = JSON.parse(JSON.stringify(data));
                        showResults(searchHotels);
                    }
                }

                let reset = $("#reset");
                reset.on("click", resetFilters);
                function resetFilters() {
                    $("input:checkbox").prop("checked", false);
                    lastFilteredResult = JSON.parse(JSON.stringify(searchHotels));
                    showResults(searchHotels);
                }


                let star1 = $("#1star");
                star1.on("change", handleStar1);

                function handleStar1() {
                    if (star1.is(":checked"))
                        handleStar(1);
                    else {
                        lastFilteredResult = JSON.parse(JSON.stringify(searchHotels));
                        showResults(searchHotels);
                    }
                }


                let star2 = $("#2star");
                star2.on("change", handleStar2);

                function handleStar2() {
                    if (star2.is(":checked"))
                        handleStar(2);
                    else {
                        lastFilteredResult = JSON.parse(JSON.stringify(searchHotels));
                        showResults(searchHotels);
                    }
                }


                let star3 = $("#3star");
                star3.on("change", handleStar3);
                function handleStar3() {
                    if (star3.is(":checked"))
                        handleStar(3);
                    else {
                        lastFilteredResult = JSON.parse(JSON.stringify(searchHotels));
                        showResults(searchHotels);
                    }
                }


                let star4 = $("#4star");
                star4.on("change", handleStar4);

                function handleStar4() {
                    if (star4.is(":checked"))
                        handleStar(4);
                    else {
                        lastFilteredResult = JSON.parse(JSON.stringify(searchHotels));
                        showResults(searchHotels);
                    }
                }


                let star5 = $("#5star");
                star5.on("change", handleStar5);

                function handleStar5() {
                    if (star5.is(":checked"))
                        handleStar(5);
                    else {
                        lastFilteredResult = JSON.parse(JSON.stringify(searchHotels));
                        showResults(searchHotels);
                    }
                }


                function handleStar(starNumber) {
                    let temp = [{}];

                    lastFilteredResult.forEach(element => {
                        if (element.starsnumber === starNumber) {
                            temp = temp.concat(element);
                        }
                    });

                    lastFilteredResult = JSON.parse(JSON.stringify(temp));
                    showResults(lastFilteredResult);

                }


                let wifi = $("#wifi");
                wifi.on("change", handleWifi);

                function handleWifi() {
                    if (wifi.is(":checked"))
                        handleFacility(1);
                    else {
                        lastFilteredResult = JSON.parse(JSON.stringify(searchHotels));
                        showResults(searchHotels);
                    }
                }


                let smoke = $("#smoke");
                smoke.on("change", handleSmoke);

                function handleSmoke() {
                    if (smoke.is(":checked"))
                        handleFacility(2);
                    else {
                        lastFilteredResult = JSON.parse(JSON.stringify(searchHotels));
                        showResults(searchHotels);
                    }
                }


                let family = $("#family");
                family.on("change", handleFamily);

                function handleFamily() {
                    if (family.is(":checked"))
                        handleFacility(3);
                    else {
                        lastFilteredResult = JSON.parse(JSON.stringify(searchHotels));
                        showResults(searchHotels);
                    }
                }


                let airport = $("#airport");
                airport.on("change", handleAirport);

                function handleAirport() {
                    if (airport.is(":checked"))
                        handleFacility(4);
                    else {
                        lastFilteredResult = JSON.parse(JSON.stringify(searchHotels));
                        showResults(searchHotels);
                    }
                }


                let parking = $("#parking");
                parking.on("change", handleParking);

                function handleParking() {
                    if (parking.is(":checked"))
                        handleFacility(5);
                    else {
                        lastFilteredResult = JSON.parse(JSON.stringify(searchHotels));
                        showResults(searchHotels);
                    }
                }


                let pets = $("#pets");
                pets.on("change", handlePets);

                function handlePets() {
                    if (pets.is(":checked"))
                        handleFacility(6);
                    else {
                        lastFilteredResult = JSON.parse(JSON.stringify(searchHotels));
                        showResults(searchHotels);
                    }
                }


                let room = $("#room");
                room.on("change", handleRoom);

                function handleRoom() {
                    if (room.is(":checked"))
                        handleFacility(7);
                    else {
                        lastFilteredResult = JSON.parse(JSON.stringify(searchHotels));
                        showResults(searchHotels);
                    }
                }


                let pool = $("#pool");
                pool.on("change", handlePool);

                function handlePool() {
                    if (pool.is(":checked"))
                        handleFacility(8);
                    else {
                        lastFilteredResult = JSON.parse(JSON.stringify(searchHotels));
                        showResults(searchHotels);
                    }
                }



                let spa = $("#spa");
                spa.on("change", handleSpa);

                function handleSpa() {
                    if (spa.is(":checked"))
                        handleFacility(9);
                    else {
                        lastFilteredResult = JSON.parse(JSON.stringify(searchHotels));
                        showResults(searchHotels);
                    }
                }



                let bar = $("#bar");
                bar.on("change", handleBar);

                function handleBar() {
                    if (bar.is(":checked"))
                        handleFacility(10);
                    else {
                        lastFilteredResult = JSON.parse(JSON.stringify(searchHotels));
                        showResults(searchHotels);
                    }
                }


                function handleFacility(facilityNumber) {

                    let temp = [{}];
                    lastFilteredResult.forEach(hotel => {
                        (hotel.hotelFacilitiesCollection).forEach(element => {
                            if (element.hotelFacilitiesPK.facilityid === facilityNumber) {
                                temp = temp.concat(hotel);
                            }
                        });
                    });
                    lastFilteredResult = JSON.parse(JSON.stringify(temp));
                    showResults(lastFilteredResult);
                }


                function showResults(data) {
                    myrow.empty();

                    data.forEach(element => {
            <c:forEach items="${ratings}" var="hotel">
                        if ("${hotel.key}" == element.id) {
                            if (element.name !== undefined) {

                                let content = $("<div class='container'><div class='jumbotron jumbotron-fluid bg-white shadow rounded border-color-navy2' style='padding-top:15px; padding-bottom:15px'><div class='container'><div class='row'><div class='col-md-4 col-sm-4 col-xs-4'><div class='text-center'><img src='../resources/media/HotelPhotos/"
                                        + element.id + "/1.jpg' class='rounded' style='width:100%;height:200px'></div></div><div class='col-md-8 col-sm-8 col-xs-8'><div class='d-flex'><div class='p-2 mr-auto'><h1 class='w3-lobster  w3-xxlarge' >"
                                        + element.name + "</h1></div><div class='p-2 test rounded-circle '><h1 class='pr-3 w3-lobster  w3-xxlarge'>${hotel.value}</h1></div></div><p class='text-left'><h3 class='w3-lobster w3-xlarge'>"
                                        + element.address + "</h3></p><p class='text-left'><h6 class='title text-navy'>"
                                        + element.description + "</h6></p><div class='btn pull-right' ><a href='${pageContext.request.contextPath}/user/search/"
                                        + element.id + "'><button class='btn bg-navy w3-lobster w3-xlarge text-white '>Choose your room</button></a></div></div></div></div></div></div>")
                                        .appendTo(myrow);
                            }
                        }

            </c:forEach>
                    });


                    // Get the modal
                    var modal = document.getElementById("myModal");

                    // Get the button that opens the modal
                    var btn = document.getElementById("myBtn");

                    // Get the <span> element that closes the modal
                    var span = document.getElementsByClassName("close")[0];

                    // When the user clicks the button, open the modal 
                    btn.onclick = function () {
                        modal.style.display = "block";


                        var options = {
                            zoom: 6,
                            center: {lat: 37.9838, lng: 23.7275}
                        };

                        var map = new google.maps.Map(document.getElementById('map'), options);

                        searchHotels.forEach(element => {
                            //console.log(parseFloat(element.longtitude), element.latitude , 1);
                            addMarker({coords: {lat: parseFloat(element.longtitude), lng: parseFloat(element.latitude)},
                                content: "<h1>" + element.name + "</h1>"
                            });
                        });

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

                    };

                    // When the user clicks on <span> (x), close the modal
                    span.onclick = function () {
                        modal.style.display = "none";
                    };

                    // When the user clicks anywhere outside of the modal, close it
                    window.onclick = function (event) {
                        if (event.target == modal) {
                            modal.style.display = "none";
                        }
                    };
                }
            }
        </script>
    </body>
</html>