<!DOCTYPE html>
<html lang="en">

    <head>
        <!-- Bootstrap core CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Last Minute Booking</title>
        <link rel="stylesheet" type="text/css" href="resources/css/index.css">
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
        <a class="navbar-brand"><img src='resources/media/logo120x60.svg'></a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                    aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>        
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
            </ul>
            <form class="form-inline my-2 my-lg-0">
                <ul  class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle text-white" href="#" id="navbarDropdown" role="button"
                           data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Services
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="user/prelogin">Sign in</a>
                        <a class="dropdown-item" href="user/preregister">Register</a>                        
                    </div>
                </ul>
            </form>
        </div>
    </nav>
    <div class="fullscreen-bg">
       <video loop muted autoplay class="fullscreen-bg_video">
           <source src="resources/media/beach.mp4" type="video/mp4">
           <!-- <source src="beach2.ogv" type="video/ogv">
           <source src="beach2.webm" type="video/webm"> -->
       </video>    </div>    <div class="content">
       <h3>Enjoy the best travelling experience around continental Greece.</h3>
       <h3>Find out where is possible to go according to your budget.</h3>
       <p>A flavourful melting pot of sparkling nightspots,fresh seafood,sizzling Mediterranean passion and mythical legend, Greece is a fascinating and enchanting destination.
           The country has long held appeal for travellers, who decamp to its shores to lounch on beaches,explore ancient relics and take advantage of great Grecian hospitality.             </p>
   </div>    <script src="indexcentral.js"></script>
    </body>
</html>