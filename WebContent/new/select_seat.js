
	var row1 = new Array();
	var price = 80; //票价
	var num = 0;
	var $cart = $('#selected-seats'), //座位区
	$counter = $('#counter'), //票数
	$total = $('#total'); //总计金额
	var sc = $('#seat-map').seatCharts(
			{
				map: [  //座位图
				'aaaaaaa_aaaaaaa',
				'aaaaaaa_aaaaaaa',
				'aaaaaaa_aaaaaaa',
				'aaaaaaa_aaaaaaa',
	            'aaaaaaa_aaaaaaa',
	            'aaaaaaa_aaaaaaa',
	            'aaaaaaa_aaaaaaa',
	            'aaaaaaa_aaaaaaa',
	            'aaaaaaa_aaaaaaa',            
	            ],
	            naming : {
	            	top : false,
	            	getLabel : function (character, row, column) {
	            		return column;
	            	}
	            },
	            legend : { //定义图例
	            	node : $('#legend'),
					items : [
						[ 'a', 'available',   '可选座' ],
						[ 'a', 'unavailable', '已售出']
					]					
	            },
				click: function () { //点击事件
				if (this.status() == 'available' && num <5) { //可选座
					$('<li>'+(this.settings.row+1)+'排'+this.settings.label+'座</li>')
						.attr('id', 'cart-item-'+this.settings.id)
						.data('seatId', this.settings.id)
						.appendTo($cart);

					$counter.text(sc.find('selected').length+1);
					$total.text(recalculateTotal(sc)+price);
					num++;	
					return 'selected';
				} else if (this.status() == 'selected') { //已选中
						//更新数量
						$counter.text(sc.find('selected').length-1);
						//更新总计
						$total.text(recalculateTotal(sc)-price);
							
						//删除已预订座位
						$('#cart-item-'+this.settings.id).remove();
						//可选座
						num--;
						return 'available';
				} else if (this.status() == 'unavailable') { //已售出
					return 'unavailable';
				} else {
					return this.style();
				}
			}
		});

	$(document).ready(
		function() {
			
					//已售出的座位
		//sc.get(['1_2', '4_4','4_5','6_6','6_7','8_5','8_6','8_7','8_8', '10_1', '10_2']).status('unavailable');
		//setInterval(function() {
            //$.ajax({
                //type     : 'get',
                //url      : '/sign.jsp',
                //dataType : 'json',
                //success  : function(response) {
                    ////iterate through all bookings for our event 
                    //$.each(response.bookings, function(index, booking) {
                        ////find seat by id and set its status to unavailable
                        //sc.status(booking.seat_id, 'unavailable');
                    //});
                //}
            //});
        //}, 10000);	
	});
	
	//计算总金额
	function recalculateTotal(sc) {
		var total = 0;
		sc.find('selected').each(function () {
			total += price;
		});
				
		return total;
	}
	
