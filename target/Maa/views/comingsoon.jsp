<!doctype html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js" lang="">
<!--<![endif]-->

<head>
    <meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>MPRTS|Dashboard</title>
	<meta name="description" content="Maa Properties">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
    <style>
        .navbar-brand {
            font-size: 18px !important;
        }
		.main-area {
	position: relative;
	height: 100vh;
	z-index: 1;
	padding: 0 20px;
	background-size: cover;
	color: #fff;
}
		
		
.display-table-cell {
	display: table-cell;
	vertical-align: middle;
	text-align: center
}
.display-table {
	display: table;
	height: 100%;
	width: 100%;
}
    </style>


</head>

<body>
    <!-- Preloader -->
    <div id="preloader">
        <i class="circle-preloader"></i>
        <img src="img/logo/rounded_logo.png" alt="">
    </div>
    <!-- Left Panel -->
    
    <!-- /#left-panel -->
    <!-- Right Panel -->
    <div id="right-panel" class="right-panel">
        
        
        <div class="content">
            <!-- Animated -->
            <div class="animated fadeIn">
				<div class="main-area center-text" style="background-image:url(resources/images/1.jpg);">		
		<div class="display-table">
			<div class="display-table-cell">				
				<h1 class="title font-white"><b>Comming Soon</b></h1>
						
						
				
				
			</div><!-- display-table -->
		</div><!-- display-table-cell -->
	</div>
                
				
				
				
                
            </div>
            <!-- .animated -->
        </div>
        <!-- /.content -->
        <div class="clearfix"></div>
        <!-- Footer -->
      <!--   <footer class="site-footer">
            <div class="footer-inner bg-white">
                <div class="row">
                    <div class="col-sm-6">
                       Copyright &copy; 2019 @Maa Properties
                    </div>
                </div>
            </div>
        </footer> -->
        <!-- /.site-footer -->
    </div>
    <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
	
    

    
    
    

    <script>
        
      
        
        var toolbarOptions = [
    [{
      'header': [1, 2, 3, 4, 5, 6, false]
    }],
    ['bold', 'italic', 'underline', 'strike'], // toggled buttons
    ['blockquote', 'code-block'],

    [{
      'header': 1
    }, {
      'header': 2
    }], // custom button values
    [{
      'list': 'ordered'
    }, {
      'list': 'bullet'
    }],
    [{
      'script': 'sub'
    }, {
      'script': 'super'
    }], // superscript/subscript
    [{
      'indent': '-1'
    }, {
      'indent': '+1'
    }], // outdent/indent
    [{
      'direction': 'rtl'
    }], // text direction

    [{
      'size': ['small', false, 'large', 'huge']
    }], // custom dropdown

    [{
      'color': []
    }, {
      'background': []
    }], // dropdown with defaults from theme
    [{
      'font': []
    }],
    [{
      'align': []
    }],
    ['link', 'image'],

    ['clean'] // remove formatting button
  ];


        
        
        
    
    </script>

    
    <script>
         var quillFull = new Quill('#document-full', {
  modules: {
    toolbar: toolbarOptions,
    autoformat: true
  },
  theme: 'snow',
  placeholder: "Write something..."
});
    
    </script>
    
    <script>
    
        var quillFull = new Quill('#documenEditor', {
  modules: {
    toolbar: toolbarOptions,
    autoformat: true
  },
  theme: 'snow',
  placeholder: "Write something..."
});
    
    </script>
    
</body>

</html>