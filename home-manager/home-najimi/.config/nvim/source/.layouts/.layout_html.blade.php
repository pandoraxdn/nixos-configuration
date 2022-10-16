<!DOCTYPE html>
<html lang="es">
	<head>

		<!-- Start meta -->
		<meta 
            charset="utf-8">
	    <meta 
            name="viewport" 
            content="width=device-width, initial-scale=1">
	    <meta 
            name="author" 
            content="Rodrigo Xdn">
        <!-- End meta -->

        {{-- Start head includes --}}
        @include('includes.head')
        {{-- End head includes --}}

	    <!-- Start styles -->
	    <link href="#">
	    <!-- End styles -->

	    <!-- Start styles -->
		<title>#</title>
		<!-- End styles -->

	</head>
	<body>

		<!-- Start body -->
        @yield('content')
		<!-- End body -->
        
        <footer class="row">

        {{-- Start footer includes --}}
        @include('includes.footer')
        {{-- End footer includes --}}

        </footer>        

		<!-- Start script JS -->
		<script src="#"></script>
		<!-- End script JS -->

	</body>
</html>

