<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"   "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>GrapeCity Wijmo Workbook Viewer</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- SystemJS -->
    <script  type="module" src="node_modules/systemjs/dist/system.src.js"></script>
    <script type="module" src="systemjs.config.js"></script>
    <script src="/assets/js/app.js"></script>
    <script type="module">
        System.import('/assets/js/app');
    </script>
</head>

<body>
    <div class="container-fluid">
        <div class="row">
            <input type="file" class="form-control" id="importFile"
                accept="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet, application/vnd.ms-excel.sheet.macroEnabled.12"
                style="width:300px" />
        </div>

        <!-- Sheet tabs -->
        <ul id="sheetNav" class="nav nav-tabs" style="margin-top:40px">
        </ul>

        <!-- Current sheet view -->
        <div id="tableHost"></div>
    </div>
</body>
</html>

