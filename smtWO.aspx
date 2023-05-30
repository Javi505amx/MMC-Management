<%@ Page Language="C#" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="smtWO.aspx.cs" Inherits="ManageWO.smtWO" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="~/resources/images/icon.ico" rel="shortcut icon" />
  
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.4/font/bootstrap-icons.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous"/>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
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
    <%--TODO: agregar script js   --%>
    <script type="text/javascript">
        function disableBack() { window.history.forward(); }
        setTimeout("disableBack()", 0);
        window.onunload = function () { null };
    </script>
    <title>WO SMT</title>
</head>
<body>
    <form id="form2" runat="server">
        <nav class="navbar sticky-top navbar-expand-lg navbar-toggleable-sm navbar-dark bg-dark shadow">
            <div class="container  ">
                <a class="navbar-brand m-auto" href="./Default.aspx">
                    <img id="logo" src="./resources/images/inv.png" /></a>
                <button type="button" class="navbar-toggler" data-bs-toggle="collapse" data-bs-target=".navbar-collapse" title="Toggle navigation" aria-controls="navbarSupportedContent"
                    aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse  d-sm-inline-flex mx-auto ">
                    <ul class="navbar-nav mx-auto">
                        <%--<li class="nav-item"><a class="nav-link  text-white" runat="server" href="~/Default.aspx">Home</a></li>--%>
                        <li class="nav-item"><asp:LinkButton class=" nav-link active text-white" runat="server" ToolTip="Create, Modify & Delete WO" href="#">WO</asp:LinkButton></li>
                        <li class="nav-item"><asp:LinkButton class=" nav-link text-white" runat="server" ToolTip="Upload, Review & Delete KN"  >KN</asp:LinkButton></li>
                        <li class="nav-item"><asp:LinkButton class=" nav-link text-white" ToolTip="Upload & Delete SN" runat="server" PostBackUrl="~/FS.aspx">FS</asp:LinkButton></li>
                        <li class="nav-item"><asp:LinkButton class=" nav-link text-white" ToolTip="Upload & Delete SN" runat="server" >ALTERNS</asp:LinkButton></li>

                    </ul>
                </div>
            </div>

            <ul class=" navbar-collapse collapse navbar-nav ">
                <li>
                <asp:LinkButton runat="server" class=" fw-bold btn btn-primary me-md-2  btn-sm" type="button" ID="RegresarBtn" OnClick="RegresarBtn_Click" title="BACK"><span class=" fw-bold bi bi-backspace-fill" ></span></asp:LinkButton>
                <asp:LinkButton type="button" ID="logoutBtn" runat="server" class="btn btn-danger fw-bold  btn-sm" OnClick="logoutBtn_Click" title="LOGOUT"><span runat="server" class="bi bi-box-arrow-left"></span></asp:LinkButton>
                </li>
            </ul>
        </nav>
        <div class="contenedor-wo">
            <div class="content-index">
                <%-- alerta --%>
                <div runat="server" id="alert" visible="false" class=" d-flex align-items-center" role="alert">
                    <span id="AlertIcon" runat="server" class=" flex-shrink-0 me-2" role="img"></span>
                    <asp:Label runat="server" CssClass="fw-bold" ID="alertText" Text="">
                        
                    </asp:Label>
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
                <h2 style="text-align: center;" class="">WORK ORDER SMT</h2>
                <hr />
                <div class="form-group col-md-0">
                    <asp:Label CssClass="fw-bold form-control" Visible="false" runat="server" for="inputID">ID</asp:Label>

                    <asp:TextBox runat="server" require="required" type="text" Visible="false" class="form-control " ID="inputID" aria-describedby="basic-addon1" Enabled="false" placeholder="ID"></asp:TextBox>
                </div>

                <div class="form-group">

                    <div class="form-group col-md-6">
                        <asp:Label CssClass="fw-bold form-control label" runat="server">Work Order</asp:Label>
                        <asp:TextBox runat="server" Style="text-transform: uppercase" type="text" class="form-control" ID="inputWorkorder" aria-describedby="basic-addon1" placeholder="WORK ORDER" OnTextChanged="inputWorkorder_TextChanged"></asp:TextBox>

                    </div>
                    <div class="form-group  row g-2 ">
                        <div class="form-group col-md-4">
                            <asp:Label runat="server" CssClass="fw-bold form-control label">Quantity</asp:Label>
                            <asp:TextBox runat="server" Style="text-transform: uppercase" AutoCompleteType="Disabled" AutoPostBack="true" type="number"  class="form-control" ID="inputQty" placeholder="0000"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" CssClass="form-text" ForeColor="Red" Font-Bold="true" ControlToValidate="inputQty" runat="server" ErrorMessage="only numbers allowed" ValidationExpression="\d+" SetFocusOnError="true"> </asp:RegularExpressionValidator>
                        </div>
                        <div class="form-group col-md-8">
                            <asp:Label runat="server" CssClass="fw-bold form-control label" for="inputModel">Model</asp:Label>
                            <asp:TextBox runat="server" Style="text-transform: uppercase" type="text" class="form-control" ID="inputModel" placeholder="MODEL (MX1XXXXXXXXXXX)"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group  row g-2">
                        <div class="form-group col-md-6">
                            <asp:Label runat="server" CssClass="fw-bold form-control label" for="inputAddress">First QR</asp:Label>
                            <asp:TextBox runat="server" Style="text-transform: uppercase" type="text" class="form-control" ID="inputFirstQR" placeholder="First QR code printed"></asp:TextBox>
                        </div>
                        <div class="form-group col-md-6">
                            <asp:Label runat="server" CssClass="fw-bold form-control label">Last QR</asp:Label>
                            <asp:TextBox runat="server" Style="text-transform: uppercase" class="form-control" ID="inputLastQR" placeholder="Last QR code printed"></asp:TextBox>
                        </div>
                    </div>
                    <br />
                    <div class=" botonera form-group mb-3">
                        <asp:LinkButton ID="NewBtn" runat="server" type="submit" Text="NEW" class="boton btn btn-primary " OnClick="NewBtn_Click" Visible="false"><i class="bi bi-plus-circle-fill"></i> NEW</asp:LinkButton>
                        <asp:LinkButton ID="SaveBtn" runat="server" type="submit" Text="SAVE" class="boton btn btn-success" OnClick="SaveBtn_Click" Visible="false"><i class="bi bi-database-fill-up"></i> SAVE</asp:LinkButton>
                        <asp:LinkButton ID="DeleteBtn" runat="server" type="submit" Text="DELETE" class="boton btn btn-danger " OnClick="DeleteBtn_Click" Visible="false"><i class="bi bi-trash3-fill"></i> DELETE</asp:LinkButton>
                        <asp:LinkButton ID="ClearBtn" runat="server" type="submit" class="boton btn btn-warning " OnClick="ClearBtn_Click" Visible="false"><span runat="server" id="icono" class="bi bi-eraser-fill"></span>CLEAR </asp:LinkButton>
                        <asp:LinkButton ID="EditBtn" runat="server" type="submit" Text="EDIT" class="boton btn btn-danger" OnClick="EditBtn_Click" Visible="false"><i class="bi bi-pencil-square"></i> EDIT</asp:LinkButton>
                        <asp:LinkButton ID="UpdateBtn" runat="server" type="submit" Text="EDIT" class=" boton btn btn-warning" OnClick="UpdateBtn_Click" Visible="false"><i class="bi bi-database-fill-check"></i> UPDATE</asp:LinkButton>
                        <asp:LinkButton ID="AbortBtn" runat="server" type="submit" Text="EDIT" class=" boton btn btn-warning" OnClick="AbortBtn_Click" Visible="false"><i class="bi bi-database-fill-check"></i> UPDATE</asp:LinkButton>
                    </div>
                    <hr />
                    <div class="form-group">
                        <h2 style="text-align: center;" class="">DATA FILTER</h2>
                        <div class="input-group">
                            <asp:LinkButton ID="QueryBtn" Visible="false" CssClass="btn btn-dark fw-bold" OnClick="QueryBtn_Click" runat="server" Text="QUERY"><i class="bi bi-binoculars-fill"></i> QUERY</asp:LinkButton>
                            <%--<span class=" input-group-text bi bi-search" id="basic-addon1"></span>--%>
                            <asp:TextBox ID="filterText" CssClass="form-control" Enabled="false" Style="text-transform: uppercase; width: auto;" AutoPostBack="true" OnTextChanged="filterText_TextChanged" runat="server" type="text" class="form-control" placeholder="WorkOrder, Model" aria-label="Username" aria-describedby="basic-addon1"></asp:TextBox>

                            <asp:LinkButton ID="SearchBtn" Visible="false" CssClass=" btn btn-dark fw-bold" OnClick="SearchBtn_Click" runat="server" Text="SEARCH"><i class="bi bi-search"></i> SEARCH</asp:LinkButton>
                            <asp:LinkButton ID="RefreshBtn" Visible="false" CssClass=" btn btn-primary fw-bold" runat="server" OnClick="RefreshBtn_Click" Text="REFRESH"><i class="bi bi-arrow-clockwise"></i> REFRESH</asp:LinkButton>
                            <asp:LinkButton ID="CancelBtn" Visible="false" CssClass=" btn btn-danger fw-bold" runat="server" OnClick="CancelBtn_Click" Text="CANCEL"><i class="bi bi-x-square-fill"></i> CANCEL</asp:LinkButton>

                        </div>
                        <hr />
                    </div>

                    <div class="form-row">
                        <div class="col-md-12s col-md-offset-1">
                            <div class="form-group">
                                <div class="rounded shadow bg-white table-responsive ">
                                    <asp:GridView runat="server" ID="myTable" OnRowDataBound="myTable_RowDataBound" OnPageIndexChanging="myTable_PageIndexChanging" OnSelectedIndexChanged="myTable_SelectedIndexChanged" HeaderStyle-CssClass="bg-secondary text-white" CssClass="table table-bordered table-condensed table-responsive table-hover small-top-margin" ShowHeaderWhenEmpty="true" AutoGenerateColumns="false" DataKeyNames="WorkOrder" AutoGenerateSelectButton="true" AllowPaging="true">
                                        <AlternatingRowStyle BackColor="White" />
                                        <RowStyle BackColor="#f5f5f5" />
                                        <SelectedRowStyle BackColor="#00404d" CssClass="opacity" Font-Bold="true" ForeColor="White" />
                                        <EmptyDataTemplate>
                                            <div class="text-center">Sin registros</div>
                                        </EmptyDataTemplate>
                                        <Columns>
                                            <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" InsertVisible="true" SortExpression="ID" />
                                            <asp:BoundField DataField="WorkOrder" HeaderText="WorkOrder" ReadOnly="True" SortExpression="WorkOrder" />
                                            <asp:BoundField DataField="Model" HeaderText="Model" SortExpression="Model"></asp:BoundField>
                                            <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity"></asp:BoundField>
                                            <asp:BoundField DataField="InitialSN" HeaderText="InitialSN" SortExpression="InitialSN"></asp:BoundField>
                                            <asp:BoundField DataField="FinalSN" HeaderText="FinalSN" SortExpression="FinalSN"></asp:BoundField>
                                        </Columns>
                                        <PagerStyle HorizontalAlign="Left" BackColor="#69757D" CssClass="GridPager"  />
                                    </asp:GridView>
                                </div>
                            </div>
                        </div>
                        <asp:LinkButton CssClass="btn btn-dark fw-bold" ID="ExportBtn" runat="server" Visible="true" OnClick="ExportBtn_Click">
                <span class="bi bi-printer-fill" aria-hidden="true"></span> &nbsp;Exportar
                        </asp:LinkButton>

                    </div>
                    <hr />

                </div>
                <%-- Fin off Gridview --%>
            </div>
            <hr />
            <footer>
                <p><b>Last Updated:</b><asp:Label runat="server" ID="footer" Visible="true"></asp:Label> <b>&copy;Designed for MMC Inventronics</b></p>
            </footer>
        </div>
    </form>

</body>
</html>
