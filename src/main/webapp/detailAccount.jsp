<%@ page import="com.example.btl_web_book.model.User" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="com.example.btl_web_book.model.Cart" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>

<%
    User auth = (User) request.getSession().getAttribute("auth");
    if(auth!= null){
        request.setAttribute("auth", auth);
    }
    List<Cart> cartArrayList = (ArrayList<Cart>) session.getAttribute("cart-list");
    if(cartArrayList != null){
        request.setAttribute("cartArrayList", cartArrayList);
    }
%>

<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="CSS/nav-bar.css">
    <link rel="stylesheet" href="CSS/footer.css">
    <link rel="stylesheet" href="CSS/detailAccount.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css">
</head>
<body>
    <%@include file="includes/navBar.jsp"%>
    <form action="detailAccount" method="post">
        <div class="content">
            <div class="title">THÔNG TIN TÀI KHOẢN</div>
            <div class="information">
                <div class="infoItem">
                    <div class="infoTitle">Tên người dùng</div>
                    <div class="infoData">
                        <svg height="25px" width="25px" version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 60.671 60.671" xml:space="preserve" fill="#000000"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"> <g> <g> <ellipse style="fill:#263A29;" cx="30.336" cy="12.097" rx="11.997" ry="12.097"></ellipse> <path style="fill:#263A29;" d="M35.64,30.079H25.031c-7.021,0-12.714,5.739-12.714,12.821v17.771h36.037V42.9 C48.354,35.818,42.661,30.079,35.64,30.079z"></path> </g> </g> </g></svg>
                        <label>
                            <input type="text" name="userName" value="${sessionScope.auth.userName}"></input>
                        </label>
                    </div>
                </div>
                <div class="infoItem">
                    <div class="infoTitle">Số điện thoại</div>
                    <div class="infoData">
                        <i class="fa fa-phone" style="color: #263A29; width: 25px"></i>
                        <label>
                            <input type="text"  name="phoneNumber" value="${sessionScope.auth.phoneNumber}"></input>
                        </label>
                    </div>
                </div>
                <div class="infoItem">
                    <div class="infoTitle">Địa chỉ</div>
                    <div class="infoData">
                        <svg  height="25px" width="25px" version="1.0" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 64 64" enable-background="new 0 0 64 64" xml:space="preserve" fill="#000000"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"> <g> <path fill="#263A29" d="M62.364,0.773c-0.694-0.509-1.526-0.772-2.366-0.772c-0.403,0-0.809,0.061-1.202,0.185l-9.276,2.93 c0.102,0.175,0.183,0.386,0.234,0.649c0.286,1.477-0.732,2.198-1.188,3.606c0.456,1.195,0.159,2.094,0.785,3.078 c0.584,0.893,1.581,0.5,1.995,1.545c0.637,1.586-0.393,3.215-1.592,4.108c-0.388,0.284-0.748,0.38-1.108,0.38 c-0.641,0-1.279-0.301-2.07-0.38c-2.212-0.213-3.385-0.97-5.555-1.546c-2.187-0.563-3.505-1.598-5.509-1.598 c-0.268,0-0.547,0.019-0.843,0.059c-1.607,0.233-3.03-0.151-3.975,1.539c-0.901,1.635-0.949,3.558,0,5.152 c0.817,1.345,1.889,1.174,3.179,1.532c0.56,0.154,1.05,0.206,1.517,0.206c0.947,0,1.794-0.213,2.901-0.213 c0.113,0,0.229,0.002,0.347,0.007c0.22,0.009,0.43,0.013,0.634,0.013c0.752,0,1.409-0.048,2.053-0.048 c0.907,0,1.787,0.095,2.869,0.55c1.321,0.55,1.836,1.601,3.178,2.061c0.495,0.169,0.945,0.233,1.372,0.233 c1.383,0,2.528-0.682,4.194-0.756c1.013-0.036,1.851-0.505,2.675-0.504c0.428,0,0.852,0.126,1.294,0.504 c1.146,1.004,0.541,2.926,1.581,4.114c0.881,1.024,1.613,1.312,2.78,1.546c0.528,0.101,1.002,0.196,1.451,0.196 c0.442,0,0.86-0.095,1.281-0.367V4C64,2.726,63.393,1.527,62.364,0.773z"></path> <path fill="#263A29" d="M46.773,14.112c0.515,0.052,0.955,0.162,1.309,0.252c0.166,0.042,0.384,0.097,0.505,0.113 c0.448-0.344,0.963-0.978,0.948-1.507c-0.477-0.184-1.27-0.527-1.872-1.448c-0.596-0.938-0.7-1.829-0.776-2.479 c-0.044-0.372-0.078-0.666-0.189-0.959c-0.163-0.426-0.175-0.896-0.034-1.329c0.223-0.688,0.527-1.231,0.772-1.667 c0.29-0.516,0.367-0.684,0.368-0.826c-0.127-0.028-0.285-0.059-0.415-0.082c-0.218-0.041-0.472-0.094-0.736-0.159L43,5.174v7.9 c0.274,0.094,0.548,0.188,0.794,0.275C44.813,13.714,45.619,14.001,46.773,14.112z"></path> <path fill="#263A29" d="M0,11v6.054c0.659,0.069,1.257,0.104,1.86,0.104c0.646,0,1.271-0.035,2.062-0.078l0.807-0.044 c0.425-0.023,0.847-0.168,1.335-0.335c0.661-0.228,1.412-0.484,2.314-0.484c0.725,0,1.437,0.173,2.098,0.504 c1.245,0.607,1.876,1.559,2.383,2.322c0.274,0.413,0.511,0.77,0.811,1.021c0.709,0.595,1.312,0.808,2.148,1.102 c0.826,0.292,1.763,0.622,2.845,1.348c0.894,0.601,1.636,1.149,2.338,1.737V0.475L2.617,7.247C1.045,7.826,0,9.324,0,11z"></path> <path fill="#263A29" d="M39.271,23.254c-0.229,0-0.467-0.004-0.716-0.015c-0.09-0.003-0.179-0.005-0.265-0.005 c-0.462,0-0.888,0.049-1.339,0.1c-0.488,0.056-0.993,0.113-1.562,0.113c-0.7,0-1.371-0.091-2.052-0.279 c-0.225-0.062-0.464-0.107-0.717-0.154c-1.016-0.191-2.55-0.479-3.646-2.281c-1.29-2.169-1.303-4.838-0.027-7.151 c1.267-2.267,3.243-2.387,4.551-2.466c0.312-0.019,0.605-0.037,0.898-0.079c0.375-0.052,0.75-0.077,1.114-0.077 c1.619,0,2.844,0.492,4.026,0.968c0.482,0.193,0.958,0.37,1.462,0.53V5.784L24.265,0.205C23.854,0.068,23.428,0,23,0v26.147 c0.383,0.402,0.779,0.836,1.213,1.329c0.519,0.591,0.866,1.182,1.146,1.657c0.334,0.567,0.521,0.873,0.81,1.06 c0.04,0.025,0.059,0.031,0.078,0.032c0.153,0,0.454-0.089,0.745-0.176c0.528-0.157,1.188-0.354,1.961-0.354 c0.571,0,1.128,0.109,1.669,0.33l0.347,0.143c1.569,0.643,3.521,1.443,4.364,4.208c0.527,1.7,0.525,3.133-0.001,4.777 c-0.387,1.233-1.182,1.86-1.657,2.234c-0.111,0.089-0.265,0.209-0.295,0.249l-0.017,0.052c-0.024,0.084,0.025,0.346,0.07,0.576 c0.123,0.635,0.309,1.595-0.14,2.712c-0.764,1.856-2.263,2.798-4.456,2.798c-0.229,0-0.461-0.009-0.689-0.023 c-1.413-0.083-2.312-0.787-2.968-1.302c-0.241-0.189-0.47-0.368-0.71-0.51c-0.576-0.34-1.048-0.718-1.47-1.091v13.345l17.796,5.62 c0.067,0.021,0.137,0.03,0.204,0.048V23.214c-0.183,0.004-0.362,0.007-0.552,0.014C40.075,23.24,39.688,23.254,39.271,23.254z"></path> <path fill="#263A29" d="M20.09,43.093c-0.058-0.004-0.114-0.009-0.17-0.012c-0.002,0.063-0.004,0.127-0.006,0.181 c-0.022,0.691-0.055,1.735-0.769,2.666c-0.82,1.09-1.949,1.666-3.265,1.666c-0.718,0-1.395-0.167-1.991-0.314l-0.363-0.088 c-1.226-0.279-1.983-1.005-2.537-1.534c-0.263-0.252-0.512-0.49-0.659-0.526c-0.365-0.088-0.682-0.164-0.861-0.164 c-0.043,0-0.122,0-0.3,0.072c-0.45,0.184-0.708,0.805-1.19,2.18c-0.151,0.434-0.31,0.884-0.489,1.333 c-0.162,0.41-0.198,0.939-0.235,1.5c-0.075,1.11-0.177,2.632-1.433,3.827C4.926,54.734,3.91,55.15,2.719,55.15 c-0.613,0-1.186-0.109-1.739-0.215l-0.104-0.021C0.57,54.854,0.281,54.782,0,54.7V60c0,1.274,0.607,2.473,1.636,3.227 C2.33,63.735,3.16,64,4,64c0.404,0,0.811-0.062,1.204-0.186L21,58.826V43.193c-0.111-0.041-0.222-0.063-0.34-0.068 C20.462,43.119,20.272,43.106,20.09,43.093z"></path> <path fill="#263A29" d="M54.77,41.25c-0.93-0.286-1.528-0.468-2.054-0.19c0.165,0.238,0.497,0.591,0.735,0.843 c0.9,0.954,2.132,2.26,1.539,3.812c-0.413,1.104-1.393,1.496-2.107,1.782c-0.679,0.271-0.833,0.373-0.87,0.572 c-0.038,0.209,0.021,0.279,0.055,0.32c0.193,0.231,0.798,0.464,1.717,0.464c1.042,0,2.11-0.295,2.721-0.751 c1.052-0.807,1.4-1.912,1.118-3.578C57.345,42.836,56.411,41.767,54.77,41.25z"></path> <path fill="#263A29" d="M60.979,30.936l-0.104-0.021c-1.498-0.3-2.675-0.772-3.893-2.189c-0.879-1.005-1.068-2.183-1.207-3.042 c-0.048-0.301-0.12-0.751-0.198-0.893c-0.146,0.012-0.427,0.09-0.676,0.158c-0.509,0.141-1.142,0.316-1.875,0.343 c-0.615,0.027-1.179,0.179-1.775,0.34c-0.728,0.196-1.553,0.418-2.508,0.418c-0.685,0-1.344-0.111-2.021-0.342 c-1.055-0.361-1.744-0.943-2.298-1.41c-0.379-0.32-0.653-0.551-1.007-0.698c-0.146-0.062-0.282-0.106-0.418-0.15V63.86 c0.088-0.023,0.178-0.036,0.265-0.065l18-6C62.898,57.25,64,55.722,64,54V30.948c-0.406,0.122-0.827,0.202-1.281,0.202 C62.105,31.15,61.533,31.041,60.979,30.936z M57.712,49.697c-0.973,0.727-2.438,1.156-3.928,1.156c-1.462,0-2.616-0.42-3.253-1.183 c-0.453-0.544-0.621-1.222-0.485-1.96c0.241-1.33,1.356-1.775,2.094-2.071c0.594-0.237,0.884-0.377,0.979-0.633 c0.147-0.386-0.616-1.195-1.122-1.731c-0.758-0.803-1.473-1.561-1.361-2.525c0.042-0.357,0.225-0.872,0.856-1.289 c0.562-0.366,1.151-0.543,1.804-0.543c0.691,0,1.332,0.196,2.01,0.404c2.427,0.763,3.889,2.44,4.29,4.872 C59.999,46.577,59.365,48.43,57.712,49.697z"></path> <path fill="#263A29" d="M12.384,21.596c-1.199-1.004-1.448-2.425-2.785-3.077c-0.437-0.219-0.837-0.302-1.221-0.302 c-1.145,0-2.145,0.739-3.539,0.816c-1.177,0.06-2.053,0.125-2.979,0.125c-0.572,0-1.169-0.027-1.86-0.094v33.519 c0.376,0.165,0.783,0.274,1.268,0.371c0.528,0.101,1.002,0.196,1.451,0.196c0.596,0,1.146-0.169,1.722-0.718 c1.184-1.127,0.521-2.926,1.188-4.616c0.817-2.041,1.099-3.943,2.786-4.63c0.393-0.158,0.725-0.22,1.054-0.22 c0.413,0,0.82,0.098,1.329,0.22c1.357,0.33,1.809,1.744,3.173,2.055c0.679,0.159,1.318,0.353,1.91,0.353 c0.609,0,1.168-0.206,1.666-0.868c0.685-0.893,0.037-2.268,0.79-3.078c0.437-0.475,0.872-0.576,1.357-0.576 c0.315,0,0.653,0.044,1.025,0.055c0.101,0.004,0.186,0.03,0.28,0.043v-14.21c-1.035-1.028-2.025-1.827-3.453-2.786 C15.631,22.888,14.193,23.113,12.384,21.596z"></path> <path fill="#263A29" d="M28.265,45.756c0.193,0.012,0.385,0.02,0.572,0.02c1.098,0,2.076-0.269,2.606-1.559 c0.43-1.072-0.335-1.951,0-3.091c0.376-1.333,1.57-1.265,1.979-2.569c0.414-1.291,0.403-2.287,0-3.587 c-0.615-2.02-1.974-2.432-3.57-3.098c-0.312-0.127-0.61-0.176-0.899-0.176c-0.952,0-1.805,0.529-2.706,0.529 c-0.376,0-0.761-0.092-1.165-0.354C24.04,31.198,23.747,30.17,23,29.161v12.98c0.759,0.649,1.463,1.474,2.484,2.075 C26.557,44.849,27.087,45.687,28.265,45.756z"></path> </g> </g></svg>
                        <label>
                            <input type="text" name="address" value="${sessionScope.auth.address}"></input>
                        </label>
                    </div>
                </div>
                <div class="infoItem">
                    <div class="infoTitle">Địa chỉ email</div>
                    <div class="infoData">
                        <svg height="25px" width="25px" version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 512 512" xml:space="preserve" fill="#000000"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"> <circle style="fill:#D6E8DB;" cx="256" cy="256" r="256"></circle> <path style="fill:#D6E8DB;" d="M396.062,148.928l-277.782,186.93l173.502,173.64c121.637-17.015,215.866-119.491,220.053-244.796 L396.062,148.928z"></path> <path style="fill:#263A29;" d="M131.489,142.222h249.02c11.867,0,21.488,9.621,21.488,21.488v155.198 c0,11.867-9.621,21.488-21.488,21.488h-20.225v47.107c0,9.206-11.13,13.815-17.637,7.306l-54.413-54.413H131.491 c-11.867,0-21.488-9.621-21.488-21.488V163.711C110.001,151.843,119.622,142.222,131.489,142.222z"></path> <g> <path style="fill:#263A29;" d="M401.998,163.711c0-11.867-9.621-21.488-21.488-21.488H255.426v198.175h32.808l54.413,54.413 c6.509,6.509,17.637,1.9,17.637-7.306v-47.107h20.225c11.867,0,21.488-9.621,21.488-21.488V163.711z"></path> <path style="fill:#263A29;" d="M342.647,394.811c6.509,6.509,17.637,1.9,17.637-7.306v-47.107h20.225 c10.692,0,19.535-7.818,21.187-18.044L256,227.556l-145.698,94.798c1.652,10.226,10.495,18.044,21.187,18.044h156.743 L342.647,394.811z"></path> </g> <path style="fill:#263A29;" d="M256,227.556l-0.574,0.374v112.468h32.808l54.413,54.413c6.509,6.509,17.637,1.9,17.637-7.306 v-47.107h20.225c10.692,0,19.535-7.818,21.187-18.044L256,227.556z"></path> <path style="fill:#263A29;" d="M116.891,147.973L256,256l139.107-108.027c-3.834-3.558-8.954-5.751-14.598-5.751h-249.02 C125.847,142.222,120.727,144.415,116.891,147.973z"></path> <path style="fill:#263A29;" d="M395.107,147.973c-3.834-3.558-8.954-5.751-14.598-5.751H255.426v113.331L256,256L395.107,147.973z"></path> </g></svg>
                        <label>
                            <input type="text" name="email" value="${sessionScope.auth.email}"></input>
                        </label>
                    </div>
                </div>
                <input type="hidden" name="id" value="${sessionScope.auth.id}">
            </div>

            </div>
<%--        </div>--%>
        <div class="divUpdate">
            <button type="submit" class="btn-update">
                Update
            </button>
        </div>
    </form>

    <footer>
        <%@include file="includes/footer.jsp"%>
    </footer>
</body>
</html>
