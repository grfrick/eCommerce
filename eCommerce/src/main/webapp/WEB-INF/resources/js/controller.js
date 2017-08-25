var cartApp = angular.module('cartApp', [])

cartApp.config(function ($httpProvider){
	$httpProvider.defaults.headers.post['X-CSRFToken'] = $('input[name=csrfmiddlewaretoken]').val();
})

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
		$scope.refreshCart(cartID);
	};
	
	$scope.addToCart = function (productId, header, token) {
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