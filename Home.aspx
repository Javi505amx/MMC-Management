<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="ManageWO.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="~/resources/images/icon.ico" rel="shortcut icon" />
    <%--<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous" />--%>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.4/font/bootstrap-icons.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://ajax.aspnetcdn.com/ajax/jquery/jquery-1.9.0.min.js"></script>
    <script src="Resources/JS/script.js"></script>
    <link rel="stylesheet" href="https://necolas.github.io/normalize.css/8.0.1/normalize.css" />
    <link rel="stylesheet" href="Resources/CSS/Styles.css" />
    <link rel="stylesheet" href="Resources/CSS/site.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" />
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;700&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
    <title>Login </title>
</head>
<body class="bg-light">
    <form id="form1" runat="server">
        <section class="vh-100">
            <div class="container-fluid">

                <div class="row">

                    <%-- --%>
                    <div class="col-sm-6 text-dark">





                        <%--<div class="px-5 ms-xl-4">
          
              <img src="Resources/images/inv." />
          <span class="h1 fw-bold mb-0">Login</span>
        </div>--%>


                        <div class="d-flex align-items-center h-custom-2 px-5 ms-xl-4 mt-4 pt-5 pt-xl-0 mt-xl-n5 " style="border-radius: 25px">
                            
                            <div style="width: 90%; border-radius: 25px" class="text-center">
                                <%-- alerta --%>
                            <div runat="server" id="alert" visible="false" class=" d-flex align-items-center " role="alert">
                                <span id="AlertIcon" runat="server" class=" flex-shrink-0 me-2" role="img"></span>
                                <asp:Label runat="server" CssClass="fw-bold" ID="alertText" Text="">
                        
                                </asp:Label>
                                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                            </div>
                                <h4 class=" text-center h4 fw-bold  texto  ">WELCOME TO MMC</h4>
                                <img class="" src="Resources/images/inv.png" style="display: flex; text-align: center; width: 100%" /><br />



                                <div class="form-outline mb-4">
                                    <asp:Label runat="server" class=" h5 fw-bold  form-label texto" for="form2Example18">USER</asp:Label>
                                    <asp:TextBox runat="server" ID="txtUsername" AutoCompleteType="Disabled" required="true" class="texto h5 form-control form-control-lg shadow text-center"  AutoPostBack="true" OnTextChanged="txtUsername_TextChanged"></asp:TextBox>

                                </div>

                                <div class="form-outline mb-4">
                                    <asp:Label runat="server" class=" h5 fw-bold form-label texto" for="form2Example28">PASSWORD</asp:Label>
                                    <asp:TextBox runat="server" ID="txtPassword" AutoPostBack="true" required="true" AutoCompleteType="Disabled" type="password" class=" h5 form-control form-control-lg shadow texto text-center"></asp:TextBox>
                                </div>

                                <div class="pt-1 mb-4">
                                    <asp:LinkButton runat="server" ID="LoginBtn" class="fw-bold btn btn-primary btn-lg btn-block shadow texto  login " type="button" OnClick="LoginBtn_Click">LOGIN</asp:LinkButton>
                                </div>

                                <p class="small mb-5 pb-lg-2"><a class="text-muted" href="#!">Forgot password?</a></p>
                                <p>Don't have an account? <a href="#!" class="link-info">Register here</a></p>

                            </div>
                        </div>
                        <footer class=" text-center  " style="position: fixed; bottom: 0; left: 9.5vw">
                            <h6><b><%:DateTime.Now.Year%>  &copy; Designed for MMC Inventronics</b></h6>
                        </footer>
                    </div>

                    <div class="col-sm-6 px-0 d-none d-sm-block ">
                        <img src="Resources/images/bg.png" alt="Login image" class="w-100 vh-100 bg" style="object-fit: cover; object-position: left;" />


                    </div>
                </div>

            </div>
        </section>
    </form>
</body>
</html>
