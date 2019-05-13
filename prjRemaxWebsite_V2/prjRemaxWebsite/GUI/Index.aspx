<%@ Page Language="C#" AutoEventWireup="true" MaintainScrollPositionOnPostback="true" CodeBehind="index.aspx.cs" Inherits="prjRemaxWebsite.GUI.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title>Remax - Home</title>

<!-- jQuery and Popper.js -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
    integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
    crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
    integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
    crossorigin="anonymous"></script>
<!-- Bootstrap’s compiled CSS and JS-->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
    integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
    crossorigin="anonymous"></script>

</head>

<body>



<!-- Header & Carrousel -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
        <a class="navbar-brand" href="#">Remax</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive"
            aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="Index.aspx">Home
                        <span class="sr-only">(current)</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">About</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Services</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Contact</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<header>
    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner" role="listbox">
            <!-- Slide One - Set the background image for this slide in the line below -->
            <div class="carousel-item active"
                style="background-image: url('https://images.unsplash.com/photo-1556909114-89e7f2bcbf97?ixlib=rb-1.2.1&auto=format&fit=crop&w=1950&q=80')">
                <div class="carousel-caption d-none d-md-block">
                    <h3 class="display-4">Home Sweet Home</h3>
                    <p class="lead">Find a place to call your own.</p>
                </div>
            </div>
            <!-- Slide Two - Set the background image for this slide in the line below -->
            <div class="carousel-item"
                style="background-image: url('https://images.unsplash.com/photo-1516156008625-3a9d6067fab5?ixlib=rb-1.2.1&auto=format&fit=crop&w=1950&q=80')">
                <div class="carousel-caption d-none d-md-block">
                    <h3 class="display-4">A Brand New Neighbourhood </h3>
                    <p class="lead" >Change your surroundings.</p>
                </div>
            </div>
            <!-- Slide Three - Set the background image for this slide in the line below -->
            <div class="carousel-item"
                style="background-image: url('https://images.unsplash.com/photo-1527689368864-3a821dbccc34?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80')">
                <div class="carousel-caption d-none d-md-block">
                    <h3 class="display-4">The Specialists</h3>
                    <p class="lead">Contact one of our agents.</p>
                </div>
            </div>
        </div>
        <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
</header>

<section class="py-5">
    <div class="container">
        <h1 class="font-weight-light">Search</h1>
        <p class="lead">Find your home sweet home!</p>
    </div>
</section>
<!-- Header & Carrousel END -->


<!-- SEARCH BAR -->
<form id="form1" runat="server">
<section class="search-sec">
    <div class="container">
       
            <div class="row">
                <div class="col-lg-12">
                    <div class="row">
                        <div class="col-lg-3 col-md-3 col-sm-12 p-0">
                            <asp:TextBox ID="txtHouseNum" runat="server" class="form-control search-slt" placeholder="Reference Number" ToolTip="Type Home Reference"></asp:TextBox>
                        </div>
                        <div class="col-lg-3 col-md-3 col-sm-12 p-0">
                            <asp:DropDownList ID="drpBeds" runat="server" class="form-control search-slt"></asp:DropDownList>                            
                        </div>
                        <div class="col-lg-3 col-md-3 col-sm-12 p-0">
                            <asp:DropDownList ID="drpBaths" runat="server" class="form-control search-slt"></asp:DropDownList>                            
                        </div>
                        <div class="col-lg-3 col-md-3 col-sm-12 p-0">
                            <asp:DropDownList ID="drpCity" runat="server" class="form-control search-slt">
                                 <asp:ListItem Value="">Location</asp:ListItem>
                                 <asp:ListItem>Montreal</asp:ListItem>
                                 <asp:ListItem>Ottawa</asp:ListItem>
                                 <asp:ListItem>Los Angeles</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="col-lg-3 col-md-3 col-sm-12 p-0">
                            <asp:DropDownList ID="drpType" runat="server" class="form-control search-slt">
                                 <asp:ListItem Value="">House Type</asp:ListItem>
                                 <asp:ListItem>Cabin</asp:ListItem>
                                 <asp:ListItem>House</asp:ListItem>
                                 <asp:ListItem>Apartment</asp:ListItem>
                                 <asp:ListItem>Mansion</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="col-lg-3 col-md-3 col-sm-12 p-0">
                            <asp:DropDownList ID="drpMin" runat="server" class="form-control search-slt"></asp:DropDownList>
                        </div>
                        <div class="col-lg-3 col-md-3 col-sm-12 p-0">
                            <asp:DropDownList ID="drpMax" runat="server" class="form-control search-slt"></asp:DropDownList>
                        </div>
                        <div class="col-lg-3 col-md-3 col-sm-12 p-0">
                            <asp:DropDownList ID="drpAgent" runat="server" class="form-control search-slt"></asp:DropDownList>
                        </div>
                        
                        <div class="col-lg-12 col-md-3 col-sm-12 p-0" style="margin-top: 2%">
                            <asp:Button ID="btnSearch" runat="server" Text="Search" class="btn btn-danger wrn-btn" OnClick="btnSearch_Click"/>
                        </div>
                    </div>
                </div>
            </div>
  

    </div>
</section>

<!-- SEARCH BAR END -->


<!-- ANNOUNCES Container -->
<div class="container">

    <!-- Seach Text -->
    <asp:Literal ID="litSearchRes" runat="server"></asp:Literal>

    <%-- HOUSE CARDS --%>
    <asp:Panel runat="server" CssClass="row" ID="houseCards">
    
         <asp:Literal ID="litHouseCards" runat="server"></asp:Literal>
  
    </asp:Panel>
    
    <!-- /.HOUSE CARDS END -->


    <!-- Pagination 1/2/3 -->
    <ul class="pagination justify-content-center">
        <li class="page-item">
            <a class="page-link" href="#" aria-label="Previous">
                <span aria-hidden="true">&laquo;</span>
                <span class="sr-only">Previous</span>
            </a>
        </li>
        <li class="page-item">
            <a class="page-link" href="#">1</a>
        </li>
        <li class="page-item">
            <a class="page-link" href="#">2</a>
        </li>
        <li class="page-item">
            <a class="page-link" href="#">3</a>
        </li>
        <li class="page-item">
            <a class="page-link" href="#" aria-label="Next">
                <span aria-hidden="true">&raquo;</span>
                <span class="sr-only">Next</span>
            </a>
        </li>
    </ul>
    <!-- Pagination 1/2/3 END -->

</div>
<!-- /ANNOUNCES container END-->


    </form>
<!-- FOOTER -->
<body class="d-flex flex-column">
        <div id="page-content">
            <div class="container text-center">
                <div class="row justify-content-center">
                    <div class="col-md-7">
                        <h1 class="font-weight-light mt-4 text-white">&nbsp;</h1>
                        <p class="lead text-white-50">&nbsp;</p>
                    </div>
                </div>
            </div>
        </div>
        <footer id="sticky-footer" class="py-4 bg-dark text-white-50">
            <div class="container text-center">
                <small>Copyright &copy; Your Website</small>
            </div>
        </footer>
    </body> 
<!-- FOOTER END -->

    
</body>
</html>



<style>
/* CARROUSEL STYLE */
/* ----------------*/
.carousel-item {
  height: 65vh;
  min-height: 350px;
  background: no-repeat center center scroll;
  -webkit-background-size: cover;
  -moz-background-size: cover;
  -o-background-size: cover;
  background-size: cover;
}


.display-4{
  text-shadow: 2px 2px 16px #8C0000
}

.carousel-item .lead{
  text-shadow: 2px 2px 16px #8C0000
}


/*   FOOTER STYLE  */
/* ----------------*/
html,
body {
  height: 100%;
  line-height: 1.4;
}

#page-content {
  flex: 1 0 auto;
}

#sticky-footer {
  flex-shrink: none;
} 


/* SEARCH BOX STYLE */
/* ----------------*/
.search-sec{
    padding: 2rem;
    margin-top: 5%;
}

.search-slt{
    display: block;
    width: 100%;
    font-size: 0.875rem;
    line-height: 1.5;
    color: #55595c;
    background-color: #fff;
    background-image: none;
    border: 1px solid #ccc;
    height: calc(3rem + 2px) !important;
    /*border-radius:0;*/
}
.wrn-btn{
    width: 100%;
    font-size: 16px;
    font-weight: 400;
    text-transform: capitalize;
    height: calc(3rem + 2px) !important;
    /*border-radius:0;*/
}

@media (min-width: 992px){
    .search-sec{
        position: relative;
        top: -114px;
        background: rgba(26, 70, 104, 0.51);
    }
}

@media (max-width: 992px){
    .search-sec{
        background: #1A4668;
    }
}

#form1 section{
    background-image: linear-gradient(to right, rgb(255, 255, 255,0.95), rgba(255, 255, 255, 0.657), rgb(255, 255, 255,0.95));
}


/* HOUSE CARD STYLE */
/* -----------------*/
.card-title span{
    font-size: 75%;
    float: right;
    font-weight: 300;
}
</style>

<script>
    //$("#exampleFormControlSelect1 option:selected").css("display", "none"); //hide the first element of the drpDwnList

    function setSession(e){
        //var userName = "House";
        var selected = document.getElementById(e.id).value;
        //sessionStorage.setItem("House", selected)
        window.location = "showHouse.aspx?HouseID="+selected ;
    }



    //////Reloading the page at the scroll previous position after form submisstion
    ////$(window).scroll(function () {
    ////    //set scroll position in session storage
    ////    sessionStorage.scrollPos = $(window).scrollTop();
    ////});
    ////var init = function () {
    ////    //return scroll position in session storage
    ////    $(window).scrollTop(sessionStorage.scrollPos || 0)
    ////};
    ////window.onload = init;

</script>