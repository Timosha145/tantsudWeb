<%@ Page Title="Tantsupaarid" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="tantsudWeb.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %></h2>
    <h3>Tantsupaarid</h3>
    <p>&nbsp;</p>
    <p>
        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1" EmptyDataText="There are no data records to display." Width="500px">
            <Columns>
                <asp:BoundField DataField="tantsupaar" HeaderText="tantsupaar" SortExpression="tantsupaar" />
                <asp:BoundField DataField="punktid" HeaderText="punktid" SortExpression="punktid" />
                <asp:BoundField DataField="kommentaarid" HeaderText="kommentaarid" SortExpression="kommentaarid" />
                <asp:BoundField DataField="avaliku_paev" HeaderText="avaliku_paev" SortExpression="avaliku_paev" />
                <asp:CommandField DeleteText="Kustuta" ShowDeleteButton="True" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:tantsudConnectionString1 %>" DeleteCommand="DELETE FROM [tantsud] WHERE [id] = @id" InsertCommand="INSERT INTO [tantsud] ([tantsupaar], [punktid], [avalik], [avaliku_paev], [kommentaarid]) VALUES (@tantsupaar, @punktid, @avalik, @avaliku_paev, @kommentaarid)" ProviderName="<%$ ConnectionStrings:tantsudConnectionString1.ProviderName %>" SelectCommand="SELECT [id], [tantsupaar], [punktid], [avalik], [avaliku_paev], [kommentaarid] FROM [tantsud]" UpdateCommand="UPDATE [tantsud] SET [tantsupaar] = @tantsupaar, [punktid] = @punktid, [avalik] = @avalik, [avaliku_paev] = @avaliku_paev, [kommentaarid] = @kommentaarid WHERE [id] = @id">
            <DeleteParameters>
                <asp:Parameter Name="id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="tantsupaar" Type="String" />
                <asp:Parameter Name="punktid" Type="Int32" />
                <asp:Parameter Name="avalik" Type="Int32" />
                <asp:Parameter Name="avaliku_paev" Type="DateTime" />
                <asp:Parameter Name="kommentaarid" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="tantsupaar" Type="String" />
                <asp:Parameter Name="punktid" Type="Int32" />
                <asp:Parameter Name="avalik" Type="Int32" />
                <asp:Parameter Name="avaliku_paev" Type="DateTime" />
                <asp:Parameter Name="kommentaarid" Type="String" />
                <asp:Parameter Name="id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </p>
    <p>
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="id" DataSourceID="SqlDataSource1" DefaultMode="Insert" Height="50px" Width="125px">
            <Fields>
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="tantsupaar" HeaderText="tantsupaar" SortExpression="tantsupaar" />
                <asp:TemplateField HeaderText="punktid" SortExpression="punktid">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("punktid") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:DropDownList ID="DropDownList1" runat="server" SelectedValue='<%# Bind("punktid") %>'>
                            <asp:ListItem>0</asp:ListItem>
                            <asp:ListItem>1</asp:ListItem>
                        </asp:DropDownList>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("punktid") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="kommentaarid" HeaderText="kommentaarid" SortExpression="kommentaarid" />
                <asp:TemplateField HeaderText="avaliku_paev" SortExpression="avaliku_paev">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("avaliku_paev") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:Calendar ID="Calendar1" runat="server" SelectedDate='<%# Bind("avaliku_paev") %>' Width="298px"></asp:Calendar>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("avaliku_paev") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField CancelText="Tühista" DeleteText="Kustuta" InsertText="Sisesta" ShowInsertButton="True" />
            </Fields>
        </asp:DetailsView>
    </p>

</asp:Content>
