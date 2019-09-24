<%-- 
    Document   : customer_central
    Created on : 13 ???? 2019, 3:01:47 ??
    Author     : minas
--%>
<!DOCTYPE html>
<html lang="en">

<head>

    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Find your next vacation</title>
    <link rel="stylesheet" type="text/css" href="../resources/css/customer_central.css">
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
            <ul class="navbar-nav mr-auto">
            </ul>
            <form class="form-inline my-2 my-lg-0">
                <ul class="nav-item dropdown">
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


    <div class="container " style="margin-top: 33px" >
    <div class="jumbotron jumbotron-fluid bg-white rounded border border-primary">
           
            <label class="control-label  font-weight-bold" style="margin-left: 15px" >
                   <h1>Let's find out where it's possible to go !</h1> 
                </label>        

    <div class="container">
        <form action = "${pageContext.request.contextPath}/user/search" method="post">
            <div class="row">
                <div class="col-md-12 col-sm-12 col-xs-12">
                    <div class="row">
                        <div class="col-md-2 col-sm-2 col-xs-2">
                            <div class="form-group">
                                <label class="control-label" for="budget">
                                    Total Budget
                                </label>
                                <input class="form-control" id="budget" name="budget" type="text" />
                            </div>
                        </div>
                        <div class="col-md-2 col-sm-2 col-xs-2">
                            <div class="form-group">
                                <label class="control-label" for="persons">
                                    Number of persons
                                </label>
                                <input class="form-control" id="persons" name="persons" type="text" />
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-3 col-xs-3">
                            <div class="form-group">
                                <label class="control-label" for="checkin">
                                    Check in
                                </label>
                                <input class="form-control" id="date" name="checkin" type="date" />
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-3 col-xs-3">
                            <div class="form-group">
                                <label class="control-label" for="checkout">
                                    Check out
                                </label>
                                <input class="form-control" id="date" name="checkout" type="date" />
                            </div>
                        </div>
                        <div class="col-md-2 col-sm-2 col-xs-2">
                            <div id="button_search" class="form-group">
                                <button class="btn btn-lg bg-navy text-white " id="Search"  name="Search" type="submit" >
                                    Search
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
</body>

</html>