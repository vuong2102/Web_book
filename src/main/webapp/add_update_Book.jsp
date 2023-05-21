<%@ page import="com.example.btl_web_book.model.User" %>
<%@ page import="com.example.btl_web_book.model.Product" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%
  User auth = (User) request.getSession().getAttribute("authAdmin");
  if(auth!= null){
    request.setAttribute("authAdmin", auth);
  }
%>

<!DOCTYPE html>
<html>
<head>
  <title>Title</title>
  <link rel="stylesheet" href="CSS/nav-bar.css">
  <link rel="stylesheet" href="CSS/footer.css">
  <link rel="stylesheet" href="CSS/add_update_book.css">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css">
</head>
<body>
<tbody>
<div class="container-editUser">
  <div class="card-body">
    <%
      Product product = (Product) request.getAttribute("product");
      if(product != null){
    %>
    <form action="update_book"  method="post" class="form">
        <%}else {%>
      <form action="insert_book" method="post" class="form" >
        <%}%>
        <div class="card-header">
            <% if(product != null){ %>
            <div class="register_form">Edit Book</div>
            <%}
            else{ %>
            <div class="register_form">Add New Book</div>
            <%}%>
        </div>
        <div class="form-group">
            <% if(product != null){%>
          <input type="hidden" name="id" value="<%= product.getId()%>" />
          <label class="item">
            <svg version="1.0" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 64 64" enable-background="new 0 0 64 64" xml:space="preserve" fill="#000000"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"> <g> <path fill="#F6FFDE" d="M56,62H10c-2.209,0-4-1.791-4-4s1.791-4,4-4h46V62z"></path> <g> <path fill="#617A55" d="M6,4v49.537C7.062,52.584,8.461,52,10,52h2V2H8C6.896,2,6,2.896,6,4z"></path> <path fill="#617A55" d="M56,2H14v50h42h2v-2V4C58,2.896,57.104,2,56,2z"></path> </g> <g> <path fill="#394240" d="M60,52V4c0-2.211-1.789-4-4-4H8C5.789,0,4,1.789,4,4v54c0,3.313,2.687,6,6,6h49c0.553,0,1-0.447,1-1 s-0.447-1-1-1h-1v-8C59.104,54,60,53.104,60,52z M6,4c0-1.104,0.896-2,2-2h4v50h-2c-1.539,0-2.938,0.584-4,1.537V4z M56,62H10 c-2.209,0-4-1.791-4-4s1.791-4,4-4h46V62z M56,52H14V2h42c1.104,0,2,0.896,2,2v46v2H56z"></path> <path fill="#394240" d="M43,26H23c-0.553,0-1,0.447-1,1s0.447,1,1,1h20c0.553,0,1-0.447,1-1S43.553,26,43,26z"></path> <path fill="#394240" d="M49,20H23c-0.553,0-1,0.447-1,1s0.447,1,1,1h26c0.553,0,1-0.447,1-1S49.553,20,49,20z"></path> <path fill="#394240" d="M23,16h12c0.553,0,1-0.447,1-1s-0.447-1-1-1H23c-0.553,0-1,0.447-1,1S22.447,16,23,16z"></path> </g> <path opacity="0.2" fill="#41644A" d="M6,4v49.537C7.062,52.584,8.461,52,10,52h2V2H8C6.896,2,6,2.896,6,4z"></path> </g> </g></svg>
            <div class="nameItem">Book's Name</div>
            <input type="text" value="<%=product.getName()%>" class="input" name="name" required="required">
          </label>
          <label class="item">
            <svg width="24px" height="24px" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"> <path d="M7.24 2H5.34C3.15 2 2 3.15 2 5.33V7.23C2 9.41 3.15 10.56 5.33 10.56H7.23C9.41 10.56 10.56 9.41 10.56 7.23V5.33C10.57 3.15 9.42 2 7.24 2Z" fill="#41644A"></path> <path opacity="0.4" d="M18.6695 2H16.7695C14.5895 2 13.4395 3.15 13.4395 5.33V7.23C13.4395 9.41 14.5895 10.56 16.7695 10.56H18.6695C20.8495 10.56 21.9995 9.41 21.9995 7.23V5.33C21.9995 3.15 20.8495 2 18.6695 2Z" fill="#41644A"></path> <path d="M18.6695 13.4302H16.7695C14.5895 13.4302 13.4395 14.5802 13.4395 16.7602V18.6602C13.4395 20.8402 14.5895 21.9902 16.7695 21.9902H18.6695C20.8495 21.9902 21.9995 20.8402 21.9995 18.6602V16.7602C21.9995 14.5802 20.8495 13.4302 18.6695 13.4302Z" fill="#41644A"></path> <path opacity="0.4" d="M7.24 13.4302H5.34C3.15 13.4302 2 14.5802 2 16.7602V18.6602C2 20.8502 3.15 22.0002 5.33 22.0002H7.23C9.41 22.0002 10.56 20.8502 10.56 18.6702V16.7702C10.57 14.5802 9.42 13.4302 7.24 13.4302Z" fill="#41644A"></path> </g></svg>
            <div class="nameItem">Category</div>
            <input type="text" value="<%=product.getCategory()%>" class="input" name="category">
          </label>
          <label class="item">
            <svg fill="#41644A" height="24px" width="24px" version="1.2" baseProfile="tiny" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 256 256" xml:space="preserve"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"> <path d="M77.3,43.8C61.9,38,29.6,33.2,11.8,33.5l1.1-15c20.7-0.2,57.6,5.5,74.5,13.3L77.3,43.8z M194.9,30.1l49.7,187.3l-138.8,36.9 l-49.8-186L77.6,44c2.1,0.8,4.2,1.6,6.3,2.5c13.2,5.5,23.7,12.2,30.6,19.3c-3.8,5.5-5.3,12.5-3.5,19.5c3.3,12.5,16.2,20,28.7,16.6 c12.5-3.3,20-16.2,16.6-28.7c-3.3-12.5-16.2-20-28.7-16.6c-0.3,0.1-0.6,0.2-0.8,0.2c-9.6-10.6-24-19.2-39.1-25.2l25.5-28.9 L194.9,30.1z M191.2,179.5c-4.4-16.5-23.2-16.5-31.4-16.6c-15.4-0.2-18-5-18.6-7.8c-1.2-6.6,5.5-10.1,12.4-10.4 c5.5-0.2,11.6,1.4,15.2,2.9l6.5-13.5c-5.5-1.9-12.5-4.5-21.6-3.8l-2.9-10.7l-13.8,3.7l2.7,10.3c-13,4.6-19.7,15.3-16.6,26.8 c3,11.2,12.5,14.3,21.7,16.1c7.6,1.4,27.4-0.2,28.6,8.6c0.7,4.8-3.4,9.5-11.8,10.7c-7.3,1-16.5-2.9-16.5-2.9l-7.6,13.1 c7.6,3.4,15.1,4.8,22.7,4.3l2.7,10.1l13.8-3.7l-2.5-9.6C186.9,202,194.2,190.5,191.2,179.5z"></path> </g></svg>
            <div class="nameItem"> Price</div>
            <input type="number" value="<%=product.getPrice()%>" class="input" name="price">
          </label>
          <label class="item">
            <svg fill="#41644A" width="24px" height="24px" viewBox="0 0 32 32" version="1.1" xmlns="http://www.w3.org/2000/svg"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"> <title>image</title> <path d="M0 26.016q0 2.496 1.76 4.224t4.256 1.76h20q2.464 0 4.224-1.76t1.76-4.224v-20q0-2.496-1.76-4.256t-4.224-1.76h-20q-2.496 0-4.256 1.76t-1.76 4.256v20zM4 26.016v-20q0-0.832 0.576-1.408t1.44-0.608h20q0.8 0 1.408 0.608t0.576 1.408v20q0 0.832-0.576 1.408t-1.408 0.576h-20q-0.832 0-1.44-0.576t-0.576-1.408zM6.016 24q0 0.832 0.576 1.44t1.408 0.576h16q0.832 0 1.408-0.576t0.608-1.44v-0.928q-0.224-0.448-1.12-2.688t-1.6-3.584-1.28-2.112q-0.544-0.576-1.12-0.608t-1.152 0.384-1.152 1.12-1.184 1.568-1.152 1.696-1.152 1.6-1.088 1.184-1.088 0.448q-0.576 0-1.664-1.44-0.16-0.192-0.48-0.608-1.12-1.504-1.6-1.824-0.768-0.512-1.184 0.352-0.224 0.512-0.928 2.24t-1.056 2.56v0.64zM6.016 9.024q0 1.248 0.864 2.112t2.112 0.864 2.144-0.864 0.864-2.112-0.864-2.144-2.144-0.864-2.112 0.864-0.864 2.144z"></path> </g></svg>
            <div class="nameItem">Image</div>
            <input type="text" value="<%=product.getImage()%>" class="input" name="image">
          </label>
          <label class="item">
            <svg width="24px" height="24px" viewBox="0 0 512 512" xmlns="http://www.w3.org/2000/svg" fill="#41644A" stroke="#41644A"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"> <path fill="var(--ci-primary-color, #41644A)" d="M334.627,16H48V496H472V153.373ZM440,166.627V168H320V48h1.373ZM80,464V48H288V200H440V464Z" class="ci-primary"></path> <rect width="224" height="32" x="136" y="296" fill="var(--ci-primary-color, #41644A)" class="ci-primary"></rect> <rect width="224" height="32" x="136" y="376" fill="var(--ci-primary-color, #41644A)" class="ci-primary"></rect> </g></svg>
            <div class="nameItem">Description</div>
            <input type="text" value="<%=product.getDescription()%>" class="input" name="description">
          </label>
          <label class="item">
            <svg width="24px" height="24px" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"> <path d="M7 12L12 12M17 12L14.5 12" stroke="#41644A" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path> </g></svg>
            <div class="nameItem">Quantity</div>
            <input type="number" value="<%=product.getQuantityInStore()%>" class="input" name="quantityInStore">
          </label>

            <%}else {%>

          <label class="item">
            <svg version="1.0" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 64 64" enable-background="new 0 0 64 64" xml:space="preserve" fill="#000000"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"> <g> <path fill="#F6FFDE" d="M56,62H10c-2.209,0-4-1.791-4-4s1.791-4,4-4h46V62z"></path> <g> <path fill="#617A55" d="M6,4v49.537C7.062,52.584,8.461,52,10,52h2V2H8C6.896,2,6,2.896,6,4z"></path> <path fill="#617A55" d="M56,2H14v50h42h2v-2V4C58,2.896,57.104,2,56,2z"></path> </g> <g> <path fill="#394240" d="M60,52V4c0-2.211-1.789-4-4-4H8C5.789,0,4,1.789,4,4v54c0,3.313,2.687,6,6,6h49c0.553,0,1-0.447,1-1 s-0.447-1-1-1h-1v-8C59.104,54,60,53.104,60,52z M6,4c0-1.104,0.896-2,2-2h4v50h-2c-1.539,0-2.938,0.584-4,1.537V4z M56,62H10 c-2.209,0-4-1.791-4-4s1.791-4,4-4h46V62z M56,52H14V2h42c1.104,0,2,0.896,2,2v46v2H56z"></path> <path fill="#394240" d="M43,26H23c-0.553,0-1,0.447-1,1s0.447,1,1,1h20c0.553,0,1-0.447,1-1S43.553,26,43,26z"></path> <path fill="#394240" d="M49,20H23c-0.553,0-1,0.447-1,1s0.447,1,1,1h26c0.553,0,1-0.447,1-1S49.553,20,49,20z"></path> <path fill="#394240" d="M23,16h12c0.553,0,1-0.447,1-1s-0.447-1-1-1H23c-0.553,0-1,0.447-1,1S22.447,16,23,16z"></path> </g> <path opacity="0.2" fill="#41644A" d="M6,4v49.537C7.062,52.584,8.461,52,10,52h2V2H8C6.896,2,6,2.896,6,4z"></path> </g> </g></svg>
            <div class="nameItem">Book's Name</div>
            <input type="text" class="input" name="name" required="required">
          </label>
          <label class="item">
            <svg width="24px" height="24px" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"> <path d="M7.24 2H5.34C3.15 2 2 3.15 2 5.33V7.23C2 9.41 3.15 10.56 5.33 10.56H7.23C9.41 10.56 10.56 9.41 10.56 7.23V5.33C10.57 3.15 9.42 2 7.24 2Z" fill="#41644A"></path> <path opacity="0.4" d="M18.6695 2H16.7695C14.5895 2 13.4395 3.15 13.4395 5.33V7.23C13.4395 9.41 14.5895 10.56 16.7695 10.56H18.6695C20.8495 10.56 21.9995 9.41 21.9995 7.23V5.33C21.9995 3.15 20.8495 2 18.6695 2Z" fill="#41644A"></path> <path d="M18.6695 13.4302H16.7695C14.5895 13.4302 13.4395 14.5802 13.4395 16.7602V18.6602C13.4395 20.8402 14.5895 21.9902 16.7695 21.9902H18.6695C20.8495 21.9902 21.9995 20.8402 21.9995 18.6602V16.7602C21.9995 14.5802 20.8495 13.4302 18.6695 13.4302Z" fill="#41644A"></path> <path opacity="0.4" d="M7.24 13.4302H5.34C3.15 13.4302 2 14.5802 2 16.7602V18.6602C2 20.8502 3.15 22.0002 5.33 22.0002H7.23C9.41 22.0002 10.56 20.8502 10.56 18.6702V16.7702C10.57 14.5802 9.42 13.4302 7.24 13.4302Z" fill="#41644A"></path> </g></svg>
            <div class="nameItem">Category</div>
            <input type="text" class="input" name="category" required="required">
          </label>
          <label class="item">
            <svg fill="#41644A" height="24px" width="24px" version="1.2" baseProfile="tiny" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 256 256" xml:space="preserve"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"> <path d="M77.3,43.8C61.9,38,29.6,33.2,11.8,33.5l1.1-15c20.7-0.2,57.6,5.5,74.5,13.3L77.3,43.8z M194.9,30.1l49.7,187.3l-138.8,36.9 l-49.8-186L77.6,44c2.1,0.8,4.2,1.6,6.3,2.5c13.2,5.5,23.7,12.2,30.6,19.3c-3.8,5.5-5.3,12.5-3.5,19.5c3.3,12.5,16.2,20,28.7,16.6 c12.5-3.3,20-16.2,16.6-28.7c-3.3-12.5-16.2-20-28.7-16.6c-0.3,0.1-0.6,0.2-0.8,0.2c-9.6-10.6-24-19.2-39.1-25.2l25.5-28.9 L194.9,30.1z M191.2,179.5c-4.4-16.5-23.2-16.5-31.4-16.6c-15.4-0.2-18-5-18.6-7.8c-1.2-6.6,5.5-10.1,12.4-10.4 c5.5-0.2,11.6,1.4,15.2,2.9l6.5-13.5c-5.5-1.9-12.5-4.5-21.6-3.8l-2.9-10.7l-13.8,3.7l2.7,10.3c-13,4.6-19.7,15.3-16.6,26.8 c3,11.2,12.5,14.3,21.7,16.1c7.6,1.4,27.4-0.2,28.6,8.6c0.7,4.8-3.4,9.5-11.8,10.7c-7.3,1-16.5-2.9-16.5-2.9l-7.6,13.1 c7.6,3.4,15.1,4.8,22.7,4.3l2.7,10.1l13.8-3.7l-2.5-9.6C186.9,202,194.2,190.5,191.2,179.5z"></path> </g></svg>
            <div class="nameItem"> Price</div>
            <input type="number" class="input" name="price" required="required">
          </label>
          <label class="item">
            <svg fill="#41644A" width="24px" height="24px" viewBox="0 0 32 32" version="1.1" xmlns="http://www.w3.org/2000/svg"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"> <title>image</title> <path d="M0 26.016q0 2.496 1.76 4.224t4.256 1.76h20q2.464 0 4.224-1.76t1.76-4.224v-20q0-2.496-1.76-4.256t-4.224-1.76h-20q-2.496 0-4.256 1.76t-1.76 4.256v20zM4 26.016v-20q0-0.832 0.576-1.408t1.44-0.608h20q0.8 0 1.408 0.608t0.576 1.408v20q0 0.832-0.576 1.408t-1.408 0.576h-20q-0.832 0-1.44-0.576t-0.576-1.408zM6.016 24q0 0.832 0.576 1.44t1.408 0.576h16q0.832 0 1.408-0.576t0.608-1.44v-0.928q-0.224-0.448-1.12-2.688t-1.6-3.584-1.28-2.112q-0.544-0.576-1.12-0.608t-1.152 0.384-1.152 1.12-1.184 1.568-1.152 1.696-1.152 1.6-1.088 1.184-1.088 0.448q-0.576 0-1.664-1.44-0.16-0.192-0.48-0.608-1.12-1.504-1.6-1.824-0.768-0.512-1.184 0.352-0.224 0.512-0.928 2.24t-1.056 2.56v0.64zM6.016 9.024q0 1.248 0.864 2.112t2.112 0.864 2.144-0.864 0.864-2.112-0.864-2.144-2.144-0.864-2.112 0.864-0.864 2.144z"></path> </g></svg>
            <div class="nameItem">Image</div>
            <input type="text" class="input" name="image" required="required">
          </label>
          <label class="item">
            <svg width="24px" height="24px" viewBox="0 0 512 512" xmlns="http://www.w3.org/2000/svg" fill="#41644A" stroke="#41644A"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"> <path fill="var(--ci-primary-color, #41644A)" d="M334.627,16H48V496H472V153.373ZM440,166.627V168H320V48h1.373ZM80,464V48H288V200H440V464Z" class="ci-primary"></path> <rect width="224" height="32" x="136" y="296" fill="var(--ci-primary-color, #41644A)" class="ci-primary"></rect> <rect width="224" height="32" x="136" y="376" fill="var(--ci-primary-color, #41644A)" class="ci-primary"></rect> </g></svg>
            <div class="nameItem">Description</div>
            <input type="text"  class="input" name="description" required="required">
          </label>
          <label class="item">
            <svg width="24px" height="24px" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"> <path d="M7 12L12 12M17 12L14.5 12" stroke="#41644A" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path> </g></svg>
            <div class="nameItem">Quantity</div>
            <input type="number" class="input" name="quantityInStore" required="required">
          </label>

            <%}%>

          <div class="card-submit">
            <button type="submit" class="btn-submit">Save</button>
          </div>
      </form>
  </div>
</div>
</tbody>
</body>
</html>
