document.addEventListener("turbo:load", function () {
    ymaps.ready(init);

    function init() {
        const mapObj = document.getElementById("map")

        if (!mapObj) return

        const address = mapObj.getAttribute("data-address");

        const myMap = new ymaps.Map("map", {
            center: [55.76, 37.64],
            zoom: 10
        });

        const myGeocoder = ymaps.geocode(address);

        myGeocoder.then(
            function (res) {
                coordinates = res.geoObjects.get(0).geometry.getCoordinates();

                myMap.geoObjects.add(
                    new ymaps.Placemark(
                        coordinates,
                        {iconContent: address},
                        {preset: "islands#blueStretchyIcon"}
                    )
                );


                myMap.setCenter(coordinates);
                myMap.setZoom(15);
            }, function (err) {
                alert("Адрес не найден");
            }
        );
    }
})
