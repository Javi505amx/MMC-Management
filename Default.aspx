<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ManageWO.Menu" %>

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
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous" />
    <%--TODO: agregar script js   --%>
<%--    <script type="text/javascript">

        // Graph
        var ctx = document.getElementById("myChart");

        var myChart = new Chart(ctx, {
            type: "line",
            data: {
                labels: [
                    "Sunday",
                    "Monday",
                    "Tuesday",
                    "Wednesday",
                    "Thursday",
                    "Friday",
                    "Saturday",
                ],
                datasets: [
                    {
                        data: [15339, 21345, 18483, 24003, 23489, 24092, 12034],
                        lineTension: 0,
                        backgroundColor: "transparent",
                        borderColor: "#007bff",
                        borderWidth: 4,
                        pointBackgroundColor: "#007bff",
                    },
                ],
            },
            options: {
                scales: {
                    yAxes: [
                        {
                            ticks: {
                                beginAtZero: false,
                            },
                        },
                    ],
                },
                legend: {
                    display: false,
                },
            },
        });
    </script>--%>
    <script type="text/javascript">
        function disableBack() { window.history.forward(); }
        setTimeout("disableBack()", 0);
        window.onunload = function () { null };


    </script>
    <script type="text/javascript">
        function SetButtonStatus(sender, target) {
            Page_ClientValidate();
            if (!Page_IsValid)


                document.getElementById(target).disabled = true;

            else
                document.getElementById(target).disabled = false;

        }
    </script>
    <title>IT Management WO</title>
</head>
<body>
    <form id="form1" runat="server">
        <div id="sidebarMenu" class="collapse d-lg-block sidebar collapse bg-dark">
            <div class="position-sticky  bg-dark">
                <div class="list-group list-group-flush mx-3 mt-4 ">

                     <%--<a class="list-group-item list-group-item-action py-2 ripple bg-dark text-white  " ><i class="fa-fw me-3 bi-house"></i><span>Home</span> </a>--%>

                    <%--<a class="list-group-item list-group-item-action py-2 ripple bg-dark text-white " ><i class="fas fa-tachometer-alt fa-fw me-3"></i><span>Main dashboard</span> </a>--%>
                     <ul class="nav nav-pills flex-column mb-sm-auto mb-0 align-items-start">
                        <li class="dropdown">
                            <asp:LinkButton runat="server" href="#" class="nav-link dropdown-toggle  text-white" id="dropdown1" data-bs-toggle="dropdown" aria-expanded="false">
                                <i class="fa-fw me-3 bi bi-cpu-fill"></i><span>SMT</span>
                            </asp:LinkButton>
                            <ul class="dropdown-menu text-small shadow " aria-labelledby="dropdown">
                                <li><asp:LinkButton runat="server" CssClass="dropdown-item" href="smtWO.aspx">WorkOrder</asp:LinkButton></li>
                                <li><a class="dropdown-item" href="http://192.168.55.33:8081/PopulateForm.aspx">Feeder Setup</a></li>
                                <li><a class="dropdown-item" href="#">Kitting Note</a></li>
                                <li><a class="dropdown-item" href="#">Alterns</a></li>
                                <hr class="dropdown-divider" />
                                <li><a class="dropdown-item" href="#">Menu</a></li>

                            </ul>
                        </li>
                    </ul>
                      <ul class="nav nav-pills flex-column mb-sm-auto mb-0 align-items-start">
                        <li class="dropdown">
                            <a href="#" class="nav-link dropdown-toggle  text-white" id="dropdown2" data-bs-toggle="dropdown" aria-expanded="false">
                                <i class="fa-fw me-3 bi bi-motherboard"></i><span>PTH</span>
                            </a>
                            <ul class="dropdown-menu text-small  " aria-labelledby="dropdown">
                                <li><a class="dropdown-item" href="#">Workorder</a></li>
                                <li><a class="dropdown-item" href="#">Kitting Note</a></li>
                                <li><a class="dropdown-item" href="#">Serial Number</a></li>
                                  <hr class="dropdown-divider" />
                                <li><a class="dropdown-item" href="#">Menu</a></li>
                            </ul>
                        </li>
                    </ul>
                    <a href="#" class="list-group-item list-group-item-action py-2 ripple bg-dark text-white effect"><i class="fas fa-chart-area fa-fw me-3"></i><span>Webiste traffic</span></a>

                    <ul class="nav nav-pills flex-column mb-sm-auto mb-0 align-items-start">
                        <li class="dropdown">
                            <a href="#" class="nav-link dropdown-toggle  text-white" id="dropdown3" data-bs-toggle="dropdown" aria-expanded="false">
                                <i class="fa-fw me-3 bi-bootstrap"></i><span>Bootstrap</span>
                            </a>
                            <ul class="dropdown-menu text-small shadow " aria-labelledby="dropdown">
                                <li><a class="dropdown-item" href="#">New project...</a></li>
                                <li><a class="dropdown-item" href="#">Settings</a></li>
                                <li><a class="dropdown-item" href="#">Profile</a></li>

                                <li><a class="dropdown-item" href="#">Sign out</a></li>
                            </ul>
                        </li>
                    </ul>
                    <a href="#" class="list-group-item list-group-item-action py-2 ripple bg-dark text-white  " ><i class="fas fa-lock fa-fw me-3"></i><span >Password</span></a>
                    <a href="#" class="list-group-item list-group-item-action py-2 ripple bg-dark text-white"><i class="fas fa-chart-line fa-fw me-3"></i><span>Analytics</span></a>
                    <a href="#" class="list-group-item list-group-item-action py-2 ripple bg-dark text-white"><i class="fas fa-chart-pie fa-fw me-3"></i><span>SEO</span></a>
                    <a href="#" class="list-group-item list-group-item-action py-2 ripple bg-dark text-white"><i class="fas fa-chart-bar fa-fw me-3"></i><span>Orders</span></a>
                    <a href="#" class="list-group-item list-group-item-action py-2 ripple bg-dark text-white"><i class="fas fa-globe fa-fw me-3"></i><span>International</span></a>
                    <a href="#" class="list-group-item list-group-item-action py-2 ripple bg-dark text-white"><i class="fas fa-building fa-fw me-3"></i><span>Partners</span></a>
                    <a href="#" class="list-group-item list-group-item-action py-2 ripple bg-dark text-white"><i class="fas fa-calendar fa-fw me-3"></i><span>Calendar</span></a>
                    <a href="#" class="list-group-item list-group-item-action py-2 ripple bg-dark text-white"><i class="fas fa-users fa-fw me-3"></i><span>Users</span></a>
                    <%--<a href="#" class="list-group-item list-group-item-action py-2 ripple bg-dark text-white"><i class="fas fa-money-bill fa-fw me-3"></i><span>Sales</span></a>--%>
                    <asp:LinkButton type="button" ID="logoutBtn" runat="server" class="btn btn-danger fw-bold" OnClick="logoutBtn_Click"><span runat="server" class="bi bi-box-arrow-left">&nbsp;EXIT</span></asp:LinkButton>
                </div>
            </div>
        </div>
        <!-- Sidebar -->

        <nav class="navbar sticky-top navbar-expand-lg navbar-toggleable-sm navbar-dark bg-dark ">
            <div class="container ">
                <a class="navbar-brand m-auto" href="./Default.aspx">
                    <img id="logo" src="./resources/images/inv.png" class="" /></a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#sidebarMenu" aria-controls="sidebarMenu" aria-expanded="false" title="Deployable Menu" aria-label="Toggle navigation"><i class="fas fa-bars"></i></button>

<%--                <button type="button" class="navbar-toggler" data-bs-toggle="collapse" data-bs-target=".navbar-collapse" title="Toggle navigation" aria-controls="navbarSupportedContent"
                    aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>--%>

            </div>

        </nav>




        <div class="container-lg ">

            <main>
                <div class="row  ">
                    <div class="d-inline " style="margin: 1rem 0 0 0">
                        <asp:Label runat="server" ID="lblGreeting" Text="" class="h3 text-dark "></asp:Label>
                        <asp:Label runat="server" CssClass="h4 text-secondary " Style="text-transform: uppercase" ID="userDefault"></asp:Label>
                        <asp:Label runat="server" CssClass="form-text" ID="lblDate" Visible="true"></asp:Label>
                        <hr />
                    </div>
                    <%--   <div class="col-md-10 col-md-offset-2 text-center mx-auto" style="color: #666;">

                    <div class="input-group">
                        <asp:TextBox runat="server" type="text" class="form-control input-lg text-center" ID="tram" placeholder="WHAT DO YOU NEED TO DO?"></asp:TextBox>
                        <span class="input-group-btn">
                            <button class="btn btn-dark btn-lg fw-bold" type="button" title="Buscar" id="btnBusca"><i class="bi bi-search"></i>&nbsp;</button>
                        </span>
                    </div>
                    <div runat="server" visible="false" id="tram_resultados">Buscando</div>
                </div>--%>
                </div>
                <section class="row mx-auto" aria-labelledby="aspnetTitle">
                    <%--<h1 id="aspnetTitle">ASP.NET</h1>--%>
                    <p class="lead">ASP.NET is a free web framework for building great Web sites and Web applications using HTML, CSS, and JavaScript.</p>
                    <div class="d-inline"><img src="./resources/images/stadium.png" alt="stadium" style="width:100%" class="mx-auto" />
                    </div>
                    <p><a href="http://www.asp.net" class="btn btn-primary btn-md">Learn more &raquo;</a></p>
                </section>

                <div class="row">
                    <section class="col-md-4" aria-labelledby="gettingStartedTitle">

                        <h2 id="gettingStartedTitle">SMT WO Management</h2>
                        <p>
                            ASP.NET Web Forms lets you build dynamic websites using a familiar drag-and-drop, event-driven model.
                A design surface and hundreds of controls and components let you rapidly build sophisticated, powerful UI-driven sites with data access.
                        </p>
                        <p>
                            <a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301948">Learn more &raquo;</a>
                        </p>
                    </section>
                    <section class="col-md-4" aria-labelledby="librariesTitle">
                        <h2 id="librariesTitle">Get more libraries</h2>
                        <p>
                            NuGet is a free Visual Studio extension that makes it easy to add, remove, and update libraries and tools in Visual Studio projects.
                        </p>
                        <p>
                            <a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301949">Learn more &raquo;</a>
                        </p>
                    </section>
                    <section class="col-md-4" aria-labelledby="hostingTitle">
                        <h2 id="hostingTitle">Web Hosting</h2>
                        <p>
                            You can easily find a web hosting company that offers the right mix of features and price for your applications.
                        </p>
                        <p>
                            <a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301950">Learn more &raquo;</a>
                        </p>
                    </section>
                    <section class="col-md-4" aria-labelledby="hostingTitle">
                        <h2 id="hostingTitle2">Web Hosting</h2>
                        <p>
                            You can easily find a web hosting company that offers the right mix of features and price for your applications.
                        </p>
                        <p>
                            <a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301950">Learn more &raquo;</a>
                        </p>
                    </section>
                    <section class="col-md-4" aria-labelledby="hostingTitle">
                        <h2 id="hostingTitle3">Web Hosting</h2>
                        <p>
                            You can easily find a web hosting company that offers the right mix of features and price for your applications.
                        </p>
                        <p>
                            <a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301950">Learn more &raquo;</a>
                        </p>
                    </section>
                    <section class="col-md-4" aria-labelledby="librariesTitle">
                        <h2 id="librariesTitle2">Get more libraries</h2>
                        <p>
                            NuGet is a free Visual Studio extension that makes it easy to add, remove, and update libraries and tools in Visual Studio projects.
                        </p>
                        <p>
                            <a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301949">Learn more &raquo;</a>
                        </p>
                    </section>
                    <section class="col-md-4" aria-labelledby="librariesTitle">
                        <h2 id="librariesTitle3">Get more libraries</h2>
                        <p>
                            NuGet is a free Visual Studio extension that makes it easy to add, remove, and update libraries and tools in Visual Studio projects.
                        </p>
                        <p>
                            <a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301949">Learn more &raquo;</a>
                        </p>
                    </section>
                    <section class="col-md-4" aria-labelledby="librariesTitle">
                        <h2 id="librariesTitle4">Get more libraries</h2>
                        <p>
                            NuGet is a free Visual Studio extension that makes it easy to add, remove, and update libraries and tools in Visual Studio projects.
                        </p>
                        <p>
                            <a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301949" onclick="onclick">Learn more &raquo;</a>
                        </p>
                    </section>
                </div>
            </main>
        </div>

        <%-- <div class="container-fluid">
            <div class="row">
                <div class="  col-md-2 col-xs-6 col-sm-4 p text-center categ " data-busca="WO, WORKORDER, SMT, PTH" style="color: #666;">

                    <a href="./smtWO.aspx" class="m-4">
                        <img src="./resources/images/icons/wo.png" class="width:100%" /></a>
                    <h5>Work Orders</h5>

                </div>
                <div class="col-md-2 col-xs-6 col-sm-4 text-center categ" data-busca="" style="color: #666; min-height: 180px;">
                    <a href="./smtWO.aspx" class="m-4">
                        <img src="./resources/images/icons/materials.png" class="width:100%" /></a>
                    <h5>Kitting Note</h5>
                </div>
                <div class="col-md-2 col-xs-6 col-sm-4 text-center categ" data-busca="ones)" style="color: #666; min-height: 180px;">
                    <br>
                    <img src="img/iconos/actividades-economicas-adquisiciones-ventas-importaciones-exportaciones.svg" width="80" height="70"><h5>ones) </h5>
                    <br>
                </div>
                <div class="col-md-2 col-xs-6 col-sm-4 text-center categ" data-busca="ones)" style="color: #666; min-height: 180px;">
                    <br>
                    <img src="img/iconos/actividades-economicas-adquisiciones-ventas-importaciones-exportaciones.svg" width="80" height="70"><h5>ones) </h5>
                    <br>
                </div>
                <div class="col-md-2 col-xs-6 col-sm-4 text-center categ" data-busca="ones)" style="color: #666; min-height: 180px;">
                    <br>
                    <img src="img/iconos/actividades-economicas-adquisiciones-ventas-importaciones-exportaciones.svg" width="80" height="70"><h5>ones) </h5>
                    <br>
                </div>
                <div class="col-md-2 col-xs-6 col-sm-4 text-center categ" data-busca="ones)" style="color: #666; min-height: 180px;">
                    <br>
                    <img src="img/iconos/actividades-economicas-adquisiciones-ventas-importaciones-exportaciones.svg" width="80" height="70"><h5>ones) </h5>
                    <br>
                </div>
                <div class="col-md-2 col-xs-6 col-sm-4 text-center categ" data-busca="ones)" style="color: #666; min-height: 180px;">
                    <br>
                    <img src="img/iconos/actividades-economicas-adquisiciones-ventas-importaciones-exportaciones.svg" width="80" height="70"><h5>ones) </h5>
                    <br>
                </div>
                <div class="col-md-2 col-xs-6 col-sm-4 text-center categ" data-busca="ones)" style="color: #666; min-height: 180px;">
                    <br>
                    <img src="img/iconos/actividades-economicas-adquisiciones-ventas-importaciones-exportaciones.svg" width="80" height="70"><h5>ones) </h5>
                    <br>
                </div>

            </div>

        </div>--%>
    </form>
    <%--<footer class="mb-0 fixed">
                <p><%:DateTime.Now.Year%><b> &copy; MMC Inventronics</b></p>
            </footer>--%>
</body>
</html>
