var cartApp = angular.module('cartApp', [])

var csrftoken =  (function() {
    var metas = window.document.getElementsByTagName('meta');

    for (var i=0 ; i < metas.length ; i++) {
        if ( metas[i].name === "csrf-token") {
            return  metas[i].content;
        }
    }
})()

cartApp.constant('CSRF_TOKEN', csrftoken)

cartApp.config(['$httpProvider', 'CSRF_TOKEN',
    function($httpProvider, CSRF_TOKEN) {
        $httpProvider.defaults.headers.common['X-CSRF-TOKEN'] = CSRF_TOKEN;
        $httpProvider.defaults.headers.post['X-CSRFToken'] = CSRF_TOKEN;
    }])

cartApp.controller('cartCtrl', function ($scope, $http) {

	$scope.refreshCart = function () {
		$http.get('/eCommerce/rest/cart/' + $scope.cartID).success(function (data) {
			$scope.cart = data;
		});
	};
	
	$scope.clearCart = function () { 
		$http['delete']('/eCommerce/rest/cart/' + $scope.cartID).success($scope.refreshCart());
	};
	
	$scope.initCartId = function (cartID) {
		$scope.cartID = cartID;
		$scope.refreshCart();
	};
	
	$scope.addToCart = function (productId) {
		$http.put('/eCommerce/rest/cart/add/' + productId).success(function () {
			alert('Produto adicionado com sucesso ao carrinho.')
		});
	};

	$scope.removeFromCart = function (productId) {
		$http.put('/eCommerce/rest/cart/remove/' + productId).success(function (data) {
			$scope.refreshCart();
		});
	}

    $scope.calGrandTotal = function (productId) {
        var grandTotal=0;

        for (var i=0; i < $scope.cart.cartItems.length; i++) {
        	grandTotal+=$scope.cart.cartItems[i].totalPrice;
		}

		return grandTotal;
    }
})