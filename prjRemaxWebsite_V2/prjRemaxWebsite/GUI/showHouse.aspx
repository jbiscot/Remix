<%@ Page Language="C#" AutoEventWireup="true" MaintainScrollPositionOnPostback="true" CodeBehind="showHouse.aspx.cs" Inherits="prjRemaxWebsite.GUI.showHouse" %>

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

<!-- SWEET ALERT Script-->
<%--<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>--%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.29.2/sweetalert2.all.js"></script>

</head>
<body>

<!-- Page Header Navbar-->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
        <a class="navbar-brand" href="Index.aspx">Remax</a>
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
<!-- Page Header Navbar -->



<!-- PAGE CONTENT -->
<div id="mainContainer" class="container">

  <!-- Portfolio Item Heading -->
  <asp:Literal ID="litHomeTitle" runat="server"></asp:Literal>

  <!-- Portfolio Item Row -->
    <asp:Literal ID="litSelectedHouse" runat="server"></asp:Literal>


</br ><br /><br />
  <!-- AGENT AND MESSAGE -->
 <h3 class="my-4">Contact your Agent</h3>
 <hr><br>
  <div class="row">
     <form id="form1" runat="server">
        <table class="auto-style1">
            <tr>
                <td>
                    <div class="circular--landscape">
                    <asp:Image ID="imgAgent" runat="server" Height="250px" />
                    </div>
                </td>
                <td>
                    <asp:Literal ID="litAgentDesc" runat="server"></asp:Literal>
                </td>
            </tr>
        </table>
        <br />
         &nbsp;<asp:Label ID="lblMessageSent" runat="server" Text="Thanks, I'll reach you soon!" Visible="False"></asp:Label>
        <br /><br />

        <%--Div  Message --%>
            <div id="agentContactForm">
              <div class="form-group row">
                <label for="inputEmail3" class="col-sm-2 col-form-label">Email</label>
                <div class="col-sm-8">
                  <asp:textBox ID="txtEmail" type="email" runat="server" class="form-control" placeholder="Enter your email address"></asp:textBox>
                </div>
              </div>
              <div class="form-group row">
                <label for="inputPassword3" class="col-sm-2 col-form-label">Title</label>
                <div class="col-sm-8">
                  <asp:textBox ID="txtTitle" runat="server" class="form-control" placeholder="Enter a Message Title"></asp:textBox>
                </div>
              </div>
              <div class="form-group row">
                <div class="col-sm-2">Message</div>
                <div class="col-sm-8">
                    <asp:TextBox ID="txtMessage" class="form-control" runat="server" TextMode="MultiLine" rows="3" Width="100%" placeholder="Hi, Agent!"></asp:TextBox>
                </div>
              </div>
              <div class="form-group row">
                <div class="col-sm-10">
                  <asp:Button ID="btnSend" runat="server" 
                      Text="Send" 
                      OnClick="btnSend_Click"
                      style="float:right" 
                      class="btn btn-primary"
                      />
                </div>
              </div>
            </div>
        <%--Div Message END--%>

    </form> 
  </div>
 <!-- /.row -->

</div>
<!-- PAGE CONTENT END-->



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


/* HOUSE CARD STYLE */
/* -----------------*/
.card-title span{
    font-size: 75%;
    float: right;
    font-weight: 300;
}

img.img-fluid{
  border-radius: 1%;
}

#mainContainer{
   margin-top:5%;    
}


hr {
	margin-left: 1.66%;
	margin-right: 1.66%;
/*	width: 55%;*/
	height: 1px;
	border: 0;
	background-image: linear-gradient(to right, rgba(0, 0, 0, 0), rgba(0, 0, 0, 0.75), rgba(0, 0, 0, 0));
}


/* MESSAGE BOX */
/* -----------------*/
.form-group{
margin-left: auto;
margin-right: auto;
text-align: right;
}

#form1{
margin-left: auto;
margin-right: auto;
width: 75%;
}

#form1 img{
  width: auto;
  height: 100%;
  margin-left: -50px;
}

.circular--landscape {
  display: inline-block;
  position: relative;
  width: 200px;
  height: 200px;
  overflow: hidden;
  border-radius: 50%;
}

span#lblMessageSent{
    color: mediumorchid;
    font-weight: 400;
}

</style>

<script>

    //Solução 2 - 100%
    $('form').submit(function (ev) {
        ev.preventDefault();

        Swal.fire({
            title: 'Send Message?',
            text: "Make sure your email adress is correct!",
            type: 'question',
            showCancelButton: true,
            confirmButtonColor: '#3da546',
            cancelButtonColor: '#e22828',
            confirmButtonText: 'Yes, Send it!'
        }).then((result) => {
            if (result.value) {
                Swal.fire({
                    position: 'top-end',
                    type: 'success',
                    title: 'Your message was sent',
                    showConfirmButton: false,
                    timer: 1500
                }).then((e) => {
                    $(this).off('submit');
                    $("#btnSend")[0].click();
                });

                //Code in case  the final .then(e) arrow function is not used.
                //$(this).off('submit');
                //setTimeout(function () {
                //    $("#btnSend")[0].click();
                //}, 1500);
            }
        });
    });



    ////Reloading the page at the scroll previous position after form submisstion
    //$(window).scroll(function () {
    //    //set scroll position in session storage
    //    sessionStorage.scrollPos = $(window).scrollTop();
    //});
    //var init = function () {
    //    //return scroll position in session storage
    //    $(window).scrollTop(sessionStorage.scrollPos || 0)
    //};
    ////window.onload = init;

</script>