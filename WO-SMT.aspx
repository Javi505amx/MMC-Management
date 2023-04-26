<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WO-SMT.aspx.cs" Inherits="ManageWO.WO_SMT" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="~/resources/images2/icon.ico" rel="shortcut icon" />
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


    <title>IT Management WO</title>
</head>
<body>
    <nav class="navbar navbar-expand-sm navbar-toggleable-sm navbar-dark bg-dark">
        <div class="container">
            <a class="navbar-brand" href="./Default.aspx">
                <img id="logo" src="./resources/images2/inv.png" /></a>
            <button type="button" class="navbar-toggler" data-bs-toggle="collapse" data-bs-target=".navbar-collapse" title="Toggle navigation" aria-controls="navbarSupportedContent"
                aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse d-sm-inline-flex justify-content-between">
                <ul class="navbar-nav flex-grow-1">
                    <li class="nav-item"><a class="nav-link " runat="server" href="~/SMT-Menu.aspx">MODIFICAR</a></li>
                    <li class="nav-item"><a class="nav-link" runat="server" href="~/PTH-Menu.aspx">CREAR</a></li>
                </ul>
            </div>
        </div>
    </nav>


    <form id="form1" runat="server">
        <div class="contenedor-wo">
            <div class="content-index">
                <%-- alerta --%>
                <div runat="server" id="alert" visible="true" class="alert alert-success  alert-dismissible d-flex align-items-center" role="alert">
                    <span class="bi bi-check-circle-fill flex-shrink-0 me-2" role="img"></span>
                    <asp:Label runat="server" CssClass="fw-bold" ID="alertText" Text="Created Succesfully">
                        
                    </asp:Label>
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
                <%--<h2 class="">WORK ORDER SMT</h2>--%>

                <%--      <div class="form-row col-md-6">

                      <div class=" col-md-3">
                        <asp:Label runat="server" CssClass="fw-bold">Action to do</asp:Label>
                        <asp:DropDownList runat="server" class="form-control">
                            <asp:ListItem Selected="True" Value="NA"> Choose.. </asp:ListItem>
                            <asp:ListItem Text="Modify" Value="Modify"></asp:ListItem>
                            <asp:ListItem Text="Create" Value="Create"></asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <div class="input-group mb-3">
                        <span class=" input-group-text bi bi-search" id="basic-addon1"></span>
                        <asp:TextBox runat="server" type="text" class="form-control" placeholder="WorkOrder" aria-label="Username" aria-describedby="basic-addon1"></asp:TextBox>
                        <asp:Button CssClass=" btn btn-dark fw-bold  " runat="server" Text="SEARCH" />
                    </div>
                </div>--%>


                <div class="form-row">
                    <div class="form-group col-md-6">

                        <asp:Label CssClass="fw-bold" runat="server" for="inputWorkOrder">Work Order</asp:Label>

                        <asp:TextBox runat="server" type="text" class="form-control " ID="inputWorkorder" aria-describedby="basic-addon1" placeholder=""></asp:TextBox>

                    </div>
                    <div class="form-group col-md-6">
                        <asp:Label runat="server" CssClass="fw-bold" for="inputPassword4">Model</asp:Label>
                        <asp:TextBox runat="server" type="text" class="form-control" ID="inputPassword4" placeholder=""></asp:TextBox>
                    </div>
                </div>
                <div class="form-group">
                    <div class="form-group col-md-2">
                        <asp:Label runat="server" CssClass="fw-bold">Quantity</asp:Label>
                        <asp:TextBox runat="server" type="text" class="form-control" ID="inputCity"></asp:TextBox>
                    </div>
                    <div class="form-group col-md-8">
                        <asp:Label runat="server" CssClass="fw-bold" for="inputAddress">First QR</asp:Label>
                        <asp:TextBox runat="server" type="text" class="form-control" ID="inputAddress" placeholder=""></asp:TextBox>
                    </div>
                    <div class="form-group col-md-8">
                        <asp:Label runat="server" CssClass="fw-bold">Last QR</asp:Label>
                        <asp:TextBox runat="server" class="form-control" ID="inputAddress2" placeholder=""></asp:TextBox>
                    </div>


                </div>


                <br />
                <div class="buttons">
                    <asp:Button runat="server" type="submit" Text="GUARDAR" class="btn btn-success fw-bold" />
                    <asp:Button runat="server" type="submit" Text="CANCELAR" class="btn btn-danger fw-bold" />

                </div>


            </div>
            <div class="form-row">
                <div class="col-md-12s col-md-offset-1">
                    <div class="form-group">
                        <div class="rounded shadow bg-white table-responsive ">

                            <asp:GridView ID="myTable" OnRowDataBound="myTable_RowDataBound" HeaderStyle-CssClass="bg-secondary text-white" CssClass="table table-bordered table-condensed table-responsive table-hover small-top-margin" ShowHeaderWhenEmpty="true" runat="server" AutoGenerateColumns="false" DataKeyNames="WorkOrder" AutoGenerateSelectButton="true"  DataSourceID="GridWO_data">
                                <AlternatingRowStyle BackColor="White" />
                                <RowStyle BackColor="#f5f5f5" />
                                <SelectedRowStyle BackColor="#669999" Font-Bold="true" ForeColor="White" />
                                <EmptyDataTemplate>
                                    <div class="text-center">Sin registros</div>
                                </EmptyDataTemplate>
                                <Columns>
                                    <asp:BoundField DataField="WorkOrder" HeaderText="WorkOrder" ReadOnly="True" SortExpression="WorkOrder" />
                                    <asp:BoundField DataField="Model" HeaderText="Model" SortExpression="Model"></asp:BoundField>
                                    <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity"></asp:BoundField>
                                    <asp:BoundField DataField="InitialSN" HeaderText="InitialSN" SortExpression="InitialSN"></asp:BoundField>
                                    <asp:BoundField DataField="FinalSN" HeaderText="FinalSN" SortExpression="FinalSN"></asp:BoundField>
                                </Columns>
                            </asp:GridView>
                            <asp:SqlDataSource runat="server" ID="GridWO_data" ConnectionString="<%$ ConnectionStrings:con %>" SelectCommand="SELECT TOP (20) WorkOrder, Model, Quantity, InitialSN, FinalSN FROM WODetails ORDER BY WorkOrder DESC"></asp:SqlDataSource>
                        </div>
                    </div>
                </div>
            </div>



        </div>

    </form>

</body>
</html>
