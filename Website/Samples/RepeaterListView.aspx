<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="RepeaterListView.aspx.cs" Inherits="Samples_RepeaterListView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <h1>DTOs</h1>

    <h2>Nested Repeater</h2>

    <!--The outer repeater is for each row in the overall data set-->
    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="MenuCategoryFoodItemsODS">
        <ItemTemplate>
            <h3><%# Eval("MenuCategoryDescription") %></h3>
            <!--The inner repeater will handle the List<T> that is on each row of the overall Data set-->
            <asp:Repeater ID="FoodItemList" runat="server" DataSource='<%# Eval("FoodItems") %>'>
                <ItemTemplate>
                    <%# Eval("ItemID") %>&nbsp; &nbsp; &nbsp;
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("FoodDescription") %>'></asp:Label>&nbsp;&nbsp;
                    <%# ((decimal)Eval("CurrentPrice")).ToString("C") %>&nbsp;&nbsp;
                    <span class="badge"><%# Eval("TimesServed") %> Servings</span>
                    <br />
                </ItemTemplate>
            </asp:Repeater>

        </ItemTemplate>
    </asp:Repeater>

    <h2>Repeater with ListView</h2>
    <asp:Repeater ID="Repeater2" runat="server" DataSourceID="MenuCategoryFoodItemsODS">
        <ItemTemplate>
            <h3><%# Eval("MenuCategoryDescription") %></h3>
            <asp:ListView ID="ListViewRepeater" runat="server" DataSource='<%# Eval("FoodItems") %>'>
                <ItemTemplate>
                    <tr style="background-color: #DCDCDC; color: #000000; width:auto">
                        <td>
                            <asp:Label Text='<%# Eval("ItemID") %>' runat="server" ID="ItemIDLabel" /></td>
                        <td>
                            <asp:Label Text='<%# Eval("FoodDescription") %>' runat="server" ID="FoodDescriptionLabel" /></td>
                        <td>
                            <asp:Label Text='<%# Eval("CurrentPrice") %>' runat="server" ID="CurrentPriceLabel" /></td>
                        <td>
                            <asp:Label Text='<%# Eval("TimesServed") %>' runat="server" ID="TimesServedLabel" /></td>
                    </tr>
                </ItemTemplate>
                <AlternatingItemTemplate>
                    <tr style="background-color: #FFF8DC;">
                        <td>
                            <asp:Label Text='<%# Eval("ItemID") %>' runat="server" ID="ItemIDLabel" /></td>
                        <td>
                            <asp:Label Text='<%# Eval("FoodDescription") %>' runat="server" ID="FoodDescriptionLabel" /></td>
                        <td>
                            <asp:Label Text='<%# Eval("CurrentPrice") %>' runat="server" ID="CurrentPriceLabel" /></td>
                        <td>
                            <asp:Label Text='<%# Eval("TimesServed") %>' runat="server" ID="TimesServedLabel" /></td>
                    </tr>
                </AlternatingItemTemplate>
                <EmptyDataTemplate>
                    <table runat="server" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px;">
                        <tr>
                            <td>No data was returned.</td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
                <LayoutTemplate>
                    <table runat="server">
                        <tr runat="server">
                            <td runat="server">
                                <table runat="server" id="itemPlaceholderContainer" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px; font-family: Verdana, Arial, Helvetica, sans-serif;" border="1">
                                    <tr runat="server" style="background-color: #DCDCDC; color: #000000;">
                                        <th runat="server">ID</th>
                                        <th runat="server">Item</th>
                                        <th runat="server">$</th>
                                        <th runat="server">Servings</th>
                                    </tr>
                                    <tr runat="server" id="itemPlaceholder"></tr>
                                </table>
                            </td>
                        </tr>
                        <tr runat="server">
                            <td runat="server" style="text-align: center; background-color: #CCCCCC; font-family: Verdana, Arial, Helvetica, sans-serif; color: #000000;">
                                <asp:DataPager runat="server" ID="DataPager1">
                                    <Fields>
                                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False"></asp:NextPreviousPagerField>
                                        <asp:NumericPagerField></asp:NumericPagerField>
                                        <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False"></asp:NextPreviousPagerField>
                                    </Fields>
                                </asp:DataPager>
                            </td>
                        </tr>
                    </table>
                </LayoutTemplate>
            </asp:ListView>
        </ItemTemplate>
    </asp:Repeater>

    <asp:ObjectDataSource ID="MenuCategoryFoodItemsODS" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="MenuCategoryFoodItemsDTO_Get" TypeName="eRestaurantSystem.BLL.ItemsController"></asp:ObjectDataSource>
</asp:Content>

