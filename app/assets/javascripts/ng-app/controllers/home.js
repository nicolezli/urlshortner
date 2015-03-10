app.controller('HomeCtrl', ['$scope', '$http',
    function($scope, $http) {
        $scope.url_history = [];
        $scope.url_map = {
            origin_url: null,
            shortened_url: null
        };

        // input effect
        [].slice.call(document.querySelectorAll('input.input__field')).forEach(function(inputEl) {
            if (inputEl.value.trim() !== '') {
                classie.add(inputEl.parentNode, 'input--filled');
            }
            inputEl.addEventListener('focus', onInputFocus);
            inputEl.addEventListener('blur', onInputBlur);
        });

        function onInputFocus(ev) {
            classie.add(ev.target.parentNode, 'input--filled');
        }

        function onInputBlur(ev) {
            if (ev.target.value.trim() === '') {
                classie.remove(ev.target.parentNode, 'input--filled');
            }
        }

        // btn effect
        submitBtn = document.getElementById("btn-submit-link");
        submitBtnUI = new UIProgressButton(submitBtn, {
            callback: function(instance) {
                // spin button
                var progress = 0;
                var interval = setInterval(function() {
                    progress = Math.min(progress + Math.random() * 0.1, 1);
                    instance.setProgress(progress);
                }, 15);

                // handle null case
                $scope.url_map.origin_url = $scope.url_map.origin_url || "";
                // convert to lower case
                $scope.url_map.origin_url = $scope.url_map.origin_url.toLowerCase();
                // if submitted, do not submit again
                var found = _.find($scope.url_history, function(u) {
                    return u.origin_url == $scope.url_map.origin_url
                });
                if (found) {
                    instance.stop(1);
                    clearInterval(interval);
                } else {
                    // submit url
                    $http.post('/api/url_maps.json', $scope.url_map).
                    success(function(data, status, headers, config) {
                        if (!data.errors) {
                            $scope.url_history.unshift({
                                origin_url: data.origin_url,
                                shortened_url: data.shortened_url
                            });
                            instance.stop(1);
                        } else {
                            instance.stop(-1);
                        }
                        clearInterval(interval);
                        $scope.url_map = data;
                    }).
                    error(function(data, status, headers, config) {
                        instance.stop(-1);
                        clearInterval(interval);
                        $scope.url_map.shortened_url = null;
                    });

                }

            }
        });

        $scope.submitForm = function() {
            submitBtnUI._submit();
        }
    }
]);