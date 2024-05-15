<!DOCTYPE html>

<html lang="ar" dir="rtl">


  <head>
    <meta name="description" content="third-i checklist">

    <title>@yield('pageTitle')</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link href="{{ asset('public/backend/js/plugins/date_time/css/bootstrap-datetimepicker.min.css') }}" rel="stylesheet" media="screen">


    <link href="{{ asset('public/backend/js/plugins/bootstrap-fileinput/bootstrap-fileinput.css') }}" rel="stylesheet" type="text/css" />

    <link rel="stylesheet" href="{{ asset('public/backend/js/plugins/ckeditor/samples/css/samples.css') }}">
	  <link rel="stylesheet" href="{{ asset('public/backend/js/plugins/ckeditor/samples/toolbarconfigurator/lib/codemirror/neo.css') }}">
    <!-- Main CSS-->
    <link rel="stylesheet" href="{{ asset('public/backend/css/tagify.css') }}">
    <link rel="stylesheet" href="{{ asset('public/backend/plugins/multi_upload/image-uploader.min.css') }}">
    <link rel="stylesheet" href="https://unpkg.com/@yaireo/dragsort/dist/dragsort.css" media="print" onload="this.media='all'">
    <link rel="stylesheet" type="text/css" href="{{ asset('public/backend/css/main.css') }}">

    <!-- Font-icon css-->
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href=" {{ asset('public/backend/js/plugins/noty/noty.css') }} ">

    <link href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.css" rel="stylesheet">



    @stack('css')
    <script src="{{ asset('public/backend/js/jquery-3.3.1.min.js') }}"></script>
    <script src=" {{ asset('public/backend/js/plugins/noty/noty.min.js') }}"></script>


    <meta name="csrf-token" content="{{ csrf_token() }}">
    <style>
        .dataTables_filter{
            float: left;
        }
    </style>
  </head>

  <body class="app sidebar-mini">
    <!-- Navbar-->

    @include('layouts.backend._header')
    <!-- Sidebar menu-->

   @include('layouts.backend._aside')

    <main class="app-content">




       @yield('content')


    </main>
    <!-- Essential javascripts for application to work-->
    <script src="{{ asset('public/backend/js/popper.min.js') }}"></script>
    <script src="{{ asset('public/backend/js/bootstrap.min.js') }}"></script>
    <script src="{{ asset('public/backend/js/main.js') }}"></script>
    <!-- Page specific javascripts-->
    <script src=" {{ asset('public/backend/js/plugins/select2.min.js') }} "></script>
    <script src=" {{ asset('public/backend/js/plugins/bootstrap-datepicker.min.js') }} "></script>
     <script src=" {{ asset('public/backend/js/plugins/moment.min.js') }} "></script>
    <script src="{{ asset('public/backend/js/plugins/sweetalert.min.js') }}"></script>
    <script src="{{ asset('public/backend/plugins/multi_upload/image-uploader.min.js') }}"></script>
    <!-- Data table plugin-->
    <script src="{{ asset('public/backend/js/jQuery.tagify.min.js') }}"></script>
    <script type="text/javascript" src="{{ asset('public/backend/js/plugins/date_time/js/bootstrap-datetimepicker.js') }}" charset="UTF-8"></script>
    <script type="text/javascript" src="{{ asset('public/backend/js/plugins/jquery.dataTables.min.js') }}"></script>
    <script type="text/javascript" src="{{ asset('public/backend/js/plugins/dataTables.bootstrap.min.js') }}"></script>
    <script type="text/javascript" src="{{ asset('public/backend/js/plugins/dropzone.js') }}"></script>
    <script type="text/javascript" src="{{ asset('public/backend/js/plugins/select2.min.js') }}"></script>



    <script src="{{ asset('public/backend/js/plugins/ckeditor/ckeditor.js') }}"></script>
    <script src="{{ asset('public/backend/js/plugins/ckeditor/samples/js/sample.js') }}"></script>

    <script src="{{ asset('public/backend/js/plugins/bootstrap-fileinput/bootstrap-fileinput.js') }}" type="text/javascript"></script>
    <script type="text/javascript">
    /*$('#sampleTable').DataTable({
         fixedHeader: {
                header: true,
                footer: true
            },

            scrollY: 400
    });*/
   $('#sampleTable').DataTable({
        lengthMenu: [7,10, 25, 50, 75, 100,150]
    });

    </script>
    <!-- The javascript plugin to display page loading on top-->
    <script src="{{ asset('public/backend/js/plugins/pace.min.js') }}"></script>
    <script type="text/javascript" src="{{ asset('public/backend/js/plugins/bootstrap-datepicker.min.js') }}"></script>

    {{--  <script type="text/javascript" src="{{ asset('public/backend/js/custom/checklists.js') }}"></script>  --}}

   <script>

      $(document).ready(function() {


       $(document).on('click', '.delete', function (e) {
            e.preventDefault();

            var that = $(this);

            var n = new Noty({
                text: "@lang('site.delete_confirm')",
                killer: true,
                buttons: [
                    Noty.button('Yes', 'btn btn-success mr-2 mt-2 mb-2', function () {
                        that.closest('form').submit()
                    }),

                    Noty.button('No', 'btn btn-danger mr-2 mt-2 mb-2', function () {
                        n.close();
                    }),
                ],

            });

            n.show();
        });

      // datepcer



        $('.demoDate').datepicker({
      	format: "yyyy-m-d",
      	autoclose: true,
      	todayHighlight: true
      });

    }); //end of document ready


      $('.alert').alert();

      $('.select2').select2({
      width:'100%'
      });

   $('#demoSelect').select2();
   </script>

  <script>
        $(document).ready(function() {
            $(document).on('submit', 'form', function() {
                $('button').attr('disabled', 'disabled');
            });
        });
    </script>
     <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
    <script>
        @if (Session::has('message'))
            var type = "{{ Session::get('alert-type', 'info') }}"
            switch (type) {
                case 'info':

                    toastr.options.timeOut = 10000;
                    toastr.info("{{ Session::get('message') }}");
                    var audio = new Audio('audio.mp3');
                    audio.play();
                    break;
                case 'success':

                    toastr.options.timeOut = 10000;
                    toastr.success("{{ Session::get('message') }}");
                    var audio = new Audio('audio.mp3');
                    audio.play();

                    break;
                case 'warning':

                    toastr.options.timeOut = 10000;
                    toastr.warning("{{ Session::get('message') }}");
                    var audio = new Audio('audio.mp3');
                    audio.play();

                    break;
                case 'error':

                    toastr.options.timeOut = 10000;
                    toastr.error("{{ Session::get('message') }}");
                    var audio = new Audio('audio.mp3');
                    audio.play();

                    break;
            }
        @endif
    </script>



   @stack('js')
   {{-- @include('sweet::alert') --}}
  </body>
</html>
