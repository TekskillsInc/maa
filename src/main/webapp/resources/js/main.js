$.noConflict();
jQuery(document).ready(function ($) {
    "use strict";
	[].slice.call(document.querySelectorAll('select.cs-select')).forEach(function (el) {
        new SelectFx(el);
    });
    jQuery('.selectpicker').selectpicker;
    $('.search-trigger').on('click', function (event) {
        event.preventDefault();
        event.stopPropagation();
        $('.search-trigger').parent('.header-left').addClass('open');
    });
    $('.search-close').on('click', function (event) {
        event.preventDefault();
        event.stopPropagation();
        $('.search-trigger').parent('.header-left').removeClass('open');
    });
    $('.equal-height').matchHeight({
        property: 'max-height'
    });
    // var chartsheight = $('.flotRealtime2').height();
    // $('.traffic-chart').css('height', chartsheight-122);
    // Counter Number
    $('.count').each(function () {
        $(this).prop('Counter', 0).animate({
            Counter: $(this).text()
        }, {
            duration: 3000,
            easing: 'swing',
            step: function (now) {
                $(this).text(Math.ceil(now));
            }
        });
    });
    // Menu Trigger
    $('#menuToggle').on('click', function (event) {
        var windowWidth = $(window).width();
        if (windowWidth < 1010) {
            $('body').removeClass('open');
            if (windowWidth < 770) {
                $('#left-panel').slideToggle();
            } else {
                $('#left-panel').toggleClass('open-menu');
            }
        } else {
            $('body').toggleClass('open');
            $('#left-panel').removeClass('open-menu');
        }
    });
    $(".menu-item-has-children.dropdown").each(function () {
        $(this).on('click', function () {
            var $temp_text = $(this).children('.dropdown-toggle').html();
            $(this).children('.sub-menu').prepend('<li class="subtitle">' + $temp_text + '</li>');
        });
    });
    // Load Resize 
    $(window).on("load resize", function (event) {
        var windowWidth = $(window).width();
        if (windowWidth < 1010) {
            $('body').addClass('small-device');
        } else {
            $('body').removeClass('small-device');
        }
    });
    
    
    
    
    
    
    
    
    
    
    // Load Resize 
    /*$("#meterPlusAdd").on("click", function (event) {
        var windowWidth = $(window).width();
        if (windowWidth < 360) {
            $('#tableHideMbl').hide();
            $('#MeterAddDetails').show();
        } 
    });
    */
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    //Meter Reading Javascript
    $('#datepicInd').datepicker({
        uiLibrary: 'bootstrap4'
    });
    $('#datepicker').datepicker({
        uiLibrary: 'bootstrap4'
    });
    $('#datepicker1').datepicker({
        uiLibrary: 'bootstrap4'
    });
    $('#datepicker2').datepicker({
        uiLibrary: 'bootstrap4'
    });
    $('#datepicker3').datepicker({
        uiLibrary: 'bootstrap4'
    });
    $('#datepicker4').datepicker({
        uiLibrary: 'bootstrap4'
    });
    $('#datepicker5').datepicker({
        uiLibrary: 'bootstrap4'
    });
    $('#datepicker6').datepicker({
        uiLibrary: 'bootstrap4'
    });
    $('#datepicker7').datepicker({
        uiLibrary: 'bootstrap4'
    });
    $('#dateBulkpicker').datepicker({
        uiLibrary: 'bootstrap4'
    });
    $('#datepickerBlk1').datepicker({
        uiLibrary: 'bootstrap4'
    });
    $('#datepickerBlk2').datepicker({
        uiLibrary: 'bootstrap4'
    });
    $('#datepickerBlk3').datepicker({
        uiLibrary: 'bootstrap4'
    });
    $('#datepickerBlk4').datepicker({
        uiLibrary: 'bootstrap4'
    });
    $('#datepickerBlk5').datepicker({
        uiLibrary: 'bootstrap4'
    });
    $('#datepickerBlk6').datepicker({
        uiLibrary: 'bootstrap4'
    });
    $('#datepickerBlk7').datepicker({
        uiLibrary: 'bootstrap4'
    });
    $('#dateEditIndpicker').datepicker({
        uiLibrary: 'bootstrap4'
    });
    $('#dateEditInd1').datepicker({
        uiLibrary: 'bootstrap4'
    });
    $('#dateEditInd2').datepicker({
        uiLibrary: 'bootstrap4'
    });
    $('#dateEditInd3').datepicker({
        uiLibrary: 'bootstrap4'
    });
    $('#dateEditInd4').datepicker({
        uiLibrary: 'bootstrap4'
    });
    $('#dateEditInd5').datepicker({
        uiLibrary: 'bootstrap4'
    });
    $('#dateEditInd6').datepicker({
        uiLibrary: 'bootstrap4'
    });
    $('#dateEditInd7').datepicker({
        uiLibrary: 'bootstrap4'
    });
    $('#dateEditIndpicker').datepicker({
        uiLibrary: 'bootstrap4'
    });
    $('#dateAddInd1').datepicker({
        uiLibrary: 'bootstrap4'
    });
    $('#dateAddInd2').datepicker({
        uiLibrary: 'bootstrap4'
    });
    $('#dateAddInd3').datepicker({
        uiLibrary: 'bootstrap4'
    });
    $('#dateAddInd4').datepicker({
        uiLibrary: 'bootstrap4'
    });
    $('#dateAddInd5').datepicker({
        uiLibrary: 'bootstrap4'
    });
    $('#dateAddInd6').datepicker({
        uiLibrary: 'bootstrap4'
    });
    $('#dateAddInd7').datepicker({
        uiLibrary: 'bootstrap4'
    });

    $('#invoiceDatePick').datepicker({
        uiLibrary: 'bootstrap4',
    });

    $('#invoicePeriod').datepicker({
        uiLibrary: 'bootstrap4',
        format: 'mm/yyyy',
        startView: 'year',
        minView: 'year'
    });

    $('#invoiceIDdate').datepicker({
        uiLibrary: 'bootstrap4',
    });

    $("#MeterIdDetails").hide();
    $("#meterIdshow").click(function () {
        $("#MeterAddDetails").hide();
        $("#meterEditDetails").hide();
        $("#MeterIdDetails").show();
    });
    $("#meterEditDetails").hide();
    $("#meterEditshow").click(function () {
        $("#MeterIdDetails").hide();
        $("#MeterAddDetails").hide();
        $("#meterEditDetails").show();
    });
    $("#MeterAddDetails").hide();
    $("#meterPlusAdd").click(function () {
        $("#MeterIdDetails").hide();
        $("#meterEditDetails").hide();
        $("#MeterAddDetails").show();
    });
    $("#meterEditInner").click(function () {
        $("#MeterIdDetails").hide();
        $("#MeterAddDetails").hide();
        $("#meterEditDetails").show();
    });
    
    $('#ownerAddDetails').DataTable({
        columnDefs: [{
            orderable: false,
            className: 'select-checkbox',
            targets: 0
        }],
        select: {
            style: 'multi',
            selector: 'td:first-child'
        },
        order: [[1, 'asc']]
    });


});






/*Meter Details start here*/

function meterIdFunction(){        
           
             var windowWidth = $(window).width();
             var browserWindow = $(window);
        if (windowWidth < 770) {
         $('#tableHideMbl').remove();
            $('#MeterIdDetails').show();
        }
        };
        
        
        function meterEditFunction(){        
           
             var windowWidth = $(window).width();
             var browserWindow = $(window);
        if (windowWidth < 770) {
         $('#tableHideMbl').remove();
            $('#meterEditDetails').show();
        }
        };
        


/*Vendor details start here*/

$("#VendorPlusAdd").on("click", function (event) {
       var windowWidth = $(window).width();
             var browserWindow = $(window);
        if (windowWidth < 770) {
           
            $('#vendorMblVersn').hide();
            $('#VendorAdd').show();
        } 
    });
        


function vendorIdFunction(){        
           
             var windowWidth = $(window).width();
             var browserWindow = $(window);
        if (windowWidth < 770) {
         $('#vendorMblVersn').remove();
            $('#VendorIdDetails').show();
        }
        };



function vendorEditFunction(){       
           
             var windowWidth = $(window).width();
             var browserWindow = $(window);
        if (windowWidth < 770) {
         $('#vendorMblVersn').remove();
            $('#VendorEditDetails').show();
        }
        };



/*iNVOICE Details start here*/
$("#invoicePlusAdd").on("click", function (event) {
       var windowWidth = $(window).width();
             var browserWindow = $(window);
        if (windowWidth < 770) {
           
            $('#invoiceHide').hide();
            $('#invoiceAddDetails').show();
        } 
    });





/*payment detials start here*/

$("#paymentPlusAdd").on("click", function (event) {
       var windowWidth = $(window).width();
             var browserWindow = $(window);
        if (windowWidth < 770) {
           
            $('#paymentMblVersn').hide();
            $('#paymentAddPage').show();
        } 
    });
        
function PayTenantDetils(){       
           
             var windowWidth = $(window).width();
             var browserWindow = $(window);
        if (windowWidth < 770) {
         $('#paymentMblVersn').remove();
            $('#tenantPaymentIdDetails').show();
        }
        };

function payAssetDetils(){       
           
             var windowWidth = $(window).width();
             var browserWindow = $(window);
        if (windowWidth < 770) {
         $('#paymentMblVersn').remove();
            $('#proprtyPaymntIdDetails').show();
        }
        };


function ExpenceIdDisply(){
    var windowWidth = $(window).width();
             var browserWindow = $(window);
        if (windowWidth < 770) {
         $('#expenceMblVersn').remove();
            $('#ExpenseIdDetails').show();
        }
}















/*
function meterIdFunction(){        
           
             var windowWidth = $(window).width();
             var browserWindow = $(window);
        if (windowWidth < 770) {
         $('#tableHideMbl').remove();
            $('#MeterIdDetails').show();
        }
        };
        
        
        function meterEditFunction(){        
           
             var windowWidth = $(window).width();
             var browserWindow = $(window);
        if (windowWidth < 770) {
         $('#tableHideMbl').remove();
            $('#meterEditDetails').show();
        }
        };
*/



