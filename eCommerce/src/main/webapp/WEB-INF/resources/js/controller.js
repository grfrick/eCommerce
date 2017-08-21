var cartApp = angular.module("cartApp", [])

cartApp.config(function ($httpProvider){
	$httpProvider.defaults.headers.post['X-CSRFToken'] = $('input[name=csrfmiddlewaretoken]').val();
})

cartApp.controller("cartCtrl", function ($scope, $http) {
	
	//Goes to the HTTP.GET method in CartController.java to retrieve the cart JSON object
	//(which is passed into the response body)
	//If success, the cart JSON would be stored in data
	$scope.refreshCart = function (cartID) {
		$http.get('/eCommerce/rest/cart/' + $scope.cartID).success(function (data) {
			$scope.cart = data;
		});
	};
	
	$scope.clearCart = function () { 
		$http['delete']('/eCommerce/rest/cart/' + $scope.cartID).success($scope.refreshCart($scope.cartID));
	};
	
	$scope.initCartId = function (cartID) {
		$scope.cartID = cartID;
		$scope.refreshCart(cartID);
	};
	
	$scope.addToCart = function (productID, header, token) {
		$http.put('/eCommerce/rest/cart/add/' + productID, {csrf_token: token}).success(function (data) {
			$scope.refreshCart($http.get('/eCommerce/rest/cart/cartID'));
			alert("Produto adicionado com sucesso ao carrinho.")
		});
	};;
	
	$scope.removeFromCart = function (productID) {
		$http.put('/eCommerce/rest/cart/remove/' + productID).success(function (data) {
			$scope.refreshCart($http.get('/eCommerce/rest/cart/cartID'));
		});
	}
})