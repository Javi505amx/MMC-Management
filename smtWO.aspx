<%@ Page Language="C#" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="smtWO.aspx.cs" Inherits="ManageWO.smtWO" %>

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
    <%--TODO: agregar script js   --%>
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

    <title>WO SMT</title>
</head>
<body>
    <nav class="navbar navbar-fixed-top navbar-expand-sm  navbar-toggleable-sm navbar-dark bg-dark">
        <div class="container">
            <a class="navbar-brand" href="./Default.aspx">
                <img id="logo" src="./resources/images/inv.png" /></a>
            <button type="button" class="navbar-toggler" data-bs-toggle="collapse" data-bs-target=".navbar-collapse" title="Toggle navigation" aria-controls="navbarSupportedContent"
                aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse d-sm-inline-flex justify-content-between">
                <ul class="navbar-nav flex-grow-1">
                    <li class="nav-item"><a class="nav-link " runat="server" href="~/SMT-Menu.aspx">GO BACK</a></li>
                    <%--<li class="nav-item"><a class="nav-link" runat="server" href="~/PTH-Menu.aspx">EXIT</a></li>--%>
                </ul>
            </div>
        </div>
    </nav>


    <form id="form1" runat="server">
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

                <div class="form-group col-md-0">
                    <asp:Label CssClass="fw-bold form-control" Visible="false" runat="server" for="inputID">ID</asp:Label>

                    <asp:TextBox runat="server" require="required" type="text" Visible="false" class="form-control " ID="inputID" aria-describedby="basic-addon1" Enabled="false" placeholder="ID"></asp:TextBox>
                </div>

                <div class="form-group">

                    <div class="form-group col-md-6">
                        <asp:Label CssClass="fw-bold form-control label" runat="server">Work Order</asp:Label>
                        <asp:TextBox runat="server" Style="text-transform: uppercase" type="text" class="form-control" ID="inputWorkorder" aria-describedby="basic-addon1" placeholder="WORK ORDER" OnTextChanged="inputWorkorder_TextChanged"></asp:TextBox>
                        <%--<asp:RequiredFieldValidator ID="pass" runat="server" ControlToValidate="inputWorkorder" ErrorMessage="Please enter a password" ForeColor="Red"></asp:RequiredFieldValidator>--%>


                        <%--           <div class="form-group col-md-2">
                        <asp:Label CssClass="fw-bold " ID="label" BorderColor="#f5f5f5" BackColor="#f5f5f5" runat="server" ForeColor="#f5f5f5"> Hola</asp:Label>

                        <asp:Button runat="server" Text="SEARCH" class=" form-control btn btn-outline-dark fw-bold " ID="SearchBtn" OnClick="SearchBtn_Click"></asp:Button>
                    </div>--%>
                    </div>
                    <div class="form-group  row g-2 ">
                        <div class="form-group col-md-4">
                            <asp:Label runat="server" CssClass="fw-bold form-control label">Quantity</asp:Label>
                            <asp:TextBox runat="server" Style="text-transform: uppercase" AutoCompleteType="Disabled" AutoPostBack="true" type="text" onkeyup="SetButtonStatus(this, 'Button1')" class="form-control" ID="inputQty" placeholder="0000"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ForeColor="Red" Font-Bold="true" ControlToValidate="inputQty" runat="server" ErrorMessage="only numbers allowed" ValidationExpression="\d+" SetFocusOnError="true"> </asp:RegularExpressionValidator>
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
                    <%-- <div class="form-group mb-4">

                    <asp:LinkButton ID="LinkButton1" runat="server" type="submit" Text="NEW" class=" btn btn-info fw-bold text-white" OnClick="NewBtn_Click" Visible="true" ><i class="bi bi-plus-circle"></i> NEW</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton2" runat="server" type="submit" Text="SAVE" class=" btn btn-success fw-bold" OnClick="SaveBtn_Click" Visible="true" ><i class="bi bi-check-circle-fill"></i> SAVE</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton3" runat="server" type="submit" Text="DELETE" class="btn btn-danger fw-bold" OnClick="DeleteBtn_Click" Visible="true" ><i class="bi bi-trash3-fill"></i> DELETE</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton4" runat="server" type="submit"  class="btn btn-warning fw-bold text-white" OnClick="ClearBtn_Click" Visible="true" ><span runat="server" id="Span1" class="bi bi-eraser-fill"></span> CLEAR </asp:LinkButton>
                    <asp:LinkButton ID="LinkButton5" runat="server" type="submit" Text="EDIT" class="btn btn-danger fw-bold text-white" OnClick="EditBtn_Click" Visible="true" ><i class="bi bi-pencil-square"></i> EDIT</asp:LinkButton>
                </div>--%>
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

                                    <asp:GridView runat="server" ID="myTable" OnRowDataBound="myTable_RowDataBound" OnPageIndexChanging="myTable_PageIndexChanging" OnSelectedIndexChanged="myTable_SelectedIndexChanged" HeaderStyle-CssClass="bg-secondary text-white" CssClass="table table-bordered table-condensed table-responsive table-hover small-top-margin" ShowHeaderWhenEmpty="true"  AutoGenerateColumns="false" DataKeyNames="WorkOrder" AutoGenerateSelectButton="true" AllowPaging="true">
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
                                        <PagerStyle HorizontalAlign="Right" BackColor="#69757D" CssClass="GridPager" ForeColor="White" />
                                    </asp:GridView>
                                    <%--<asp:SqlDataSource runat="server" ID="GridWO_data" ConnectionString="<%$ ConnectionStrings:con %>" SelectCommand="SELECT TOP (100) ID, WorkOrder, Model, Quantity, InitialSN, FinalSN FROM WODetails ORDER BY WorkOrder DESC"></asp:SqlDataSource>--%>
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
                <p><b><i>DATE:   <%: DateTime.Now.Day%>/<%: DateTime.Now.Month%>/<%:DateTime.Now.Year%></i> <i>Last Updated:</i> <%:DateTime.Now.Hour%>:<%:DateTime.Now.Minute%>:<%:DateTime.Now.Second%> &copy;Designed for MMC Inventronics</b></p>
            </footer>
        </div>
    </form>

</body>
</html>
