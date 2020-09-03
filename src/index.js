document.addEventListener('DOMContentLoaded', () => {
    for (var i = 1; i <= 2000; i++) {
        document.write(
        '<script type="text/javascript" src="' + `/js/noise/noise_${i}.js` + '"></' +
                'script>');


        // THE FOLLOWING ALWAYS WORKS:
        // var s = document.createElement("script");
        // s.type = "text/javascript";
        // s.src = `/js/noise/noise_${i}.js`;
        // document.head.append(s);
    }
})
