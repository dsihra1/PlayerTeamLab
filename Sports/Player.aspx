<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Player.aspx.cs" Inherits="Player" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:SqlDataSource ID="dsPlayers" runat="server" ConnectionString="<%$ ConnectionStrings:devon_SportDatabaseConnectionString %>" DeleteCommand="DELETE FROM [Player] WHERE [playerID] = @playerID" InsertCommand="INSERT INTO [Player] ([playerFirstName], [playerLastName], [playerDoB], [playerPhone], [playerTeamID]) VALUES (@playerFirstName, @playerLastName, @playerDoB, @playerPhone, @playerTeamID)" SelectCommand="SELECT Player.playerID, Player.playerFirstName, Player.playerLastName, Player.playerDoB, Player.playerPhone, Player.playerTeamID, Team.teamName FROM Player INNER JOIN Team ON Player.playerTeamID = Team.teamID
WHERE (playerTeamID = @playerTeamID) OR (@playerTeamID = 0)" UpdateCommand="UPDATE [Player] SET [playerFirstName] = @playerFirstName, [playerLastName] = @playerLastName, [playerDoB] = @playerDoB, [playerPhone] = @playerPhone, [playerTeamID] = @playerTeamID WHERE [playerID] = @playerID" OnDeleted="dsPlayers_Deleted" OnInserted="dsPlayers_Inserted">
            <DeleteParameters>
                <asp:Parameter Name="playerID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="playerFirstName" Type="String" />
                <asp:Parameter Name="playerLastName" Type="String" />
                <asp:Parameter DbType="Date" Name="playerDoB" />
                <asp:Parameter Name="playerPhone" Type="String" />
                <asp:Parameter Name="playerTeamID" Type="Int32" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList3" Name="playerTeamID" PropertyName="SelectedValue" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="playerFirstName" Type="String" />
                <asp:Parameter Name="playerLastName" Type="String" />
                <asp:Parameter DbType="Date" Name="playerDoB" />
                <asp:Parameter Name="playerPhone" Type="String" />
                <asp:Parameter Name="playerTeamID" Type="Int32" />
                <asp:Parameter Name="playerID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        CHOOSE A TEAM:
        <asp:DropDownList ID="DropDownList3" runat="server" AppendDataBoundItems="True" AutoPostBack="True" DataSourceID="dsTeamList" DataTextField="teamName" DataValueField="teamID">
            <asp:ListItem Value="0">All Teams</asp:ListItem>
        </asp:DropDownList>
        <br />
        <asp:Label ID="lblError" runat="server" Font-Bold="True" Font-Italic="True" Font-Size="X-Large" ForeColor="#CC0000"></asp:Label>
        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="playerID" DataSourceID="dsPlayers">
            <Columns>
                <asp:TemplateField HeaderText="Hello" ShowHeader="False">
                    <EditItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update"></asp:LinkButton>
                        &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                    </EditItemTemplate>
                    <HeaderTemplate>
                        <asp:LinkButton ID="LinkButton3" runat="server" OnClick="LinkButton3_Click">Add Player</asp:LinkButton>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                        &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" OnClientClick="return confirm('Are you sure');" Text="Delete"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="playerFirstName" HeaderText="First Name" SortExpression="playerFirstName" />
                <asp:BoundField DataField="playerLastName" HeaderText="Last Name" SortExpression="playerLastName" />
                <asp:TemplateField HeaderText="Birth Date" SortExpression="playerDoB">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("playerDoB", "{0:d}") %>'></asp:TextBox>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="Enter a valid date." Operator="DataTypeCheck" Type="Date">*</asp:CompareValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("playerDoB", "{0:d}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="playerPhone" HeaderText="Phone" SortExpression="playerPhone" />
                <asp:TemplateField HeaderText="Team" SortExpression="teamName">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="dsTeamList" DataTextField="teamName" DataValueField="teamID" SelectedValue='<%# Bind("playerTeamID") %>'>
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("teamName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="dsTeamList" runat="server" ConnectionString="<%$ ConnectionStrings:devon_SportDatabaseConnectionString2 %>" SelectCommand="SELECT [teamName], [teamID] FROM [Team] ORDER BY [teamName]"></asp:SqlDataSource>
        <asp:DetailsView ID="dvPlayer" runat="server" AutoGenerateRows="False" DataSourceID="dsPlayers" DefaultMode="Insert" Height="50px" OnItemCommand="dvPlayer_ItemCommand" Visible="False" Width="125px" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
            <EditRowStyle BackColor="#2461BF" />
            <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
            <Fields>
                <asp:CommandField ShowInsertButton="True" />
                <asp:BoundField DataField="playerFirstName" HeaderText="playerFirstName" SortExpression="playerFirstName" />
                <asp:BoundField DataField="playerLastName" HeaderText="playerLastName" SortExpression="playerLastName" />
                <asp:BoundField DataField="playerDoB" HeaderText="playerDoB" SortExpression="playerDoB" />
                <asp:BoundField DataField="playerPhone" HeaderText="playerPhone" SortExpression="playerPhone" />
                <asp:TemplateField HeaderText="teamName" SortExpression="teamName">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("teamName") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="dsTeamList" DataTextField="teamName" DataValueField="teamID" SelectedValue='<%# Bind("playerTeamID") %>'>
                        </asp:DropDownList>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("teamName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Fields>
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
        </asp:DetailsView>
    </div>
    </form>
</body>
</html>
