﻿@using $rootnamespace$.Models.MediaTypes
@using EPiServer.Core
@using EPiServer.Web.Mvc.Html
@model ContentArea

@{
    if (Model == null)
    {
        return;
    }

    if (!Model.FilteredItems.Any())
    {
        Html.RenderContentArea(Model);
        return;
    }
    
    foreach (var content in Model.FilteredItems.Select(x => x.GetContent()).OfType<ImageFile>())
    {
        <div><img src="@Url.ContentUrl(content.ContentLink)" alt=""/></div>
    }
}