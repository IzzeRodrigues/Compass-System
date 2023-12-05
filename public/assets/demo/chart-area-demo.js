// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#292b2c';


const date = new Date();

var dia = date.getDate();

var dias = [];
var quantidade = [];
var meses = [];
var quantidadeMensal = [];

    // dias.push(`Dezembro ${i}`);
    fetch(`http://localhost:8000/puxandoPropostaData`)
    .then((response) => response.json())
    .then((json) => colocandoQuantidade(json))


function colocandoQuantidade(json)
{
    dias = json['Dias'];
    quantidade = json['Quantidade'];
    meses = json['Meses'];
    quantidadeMensal = json['QuantidadeMensal'];
    var ctx = document.getElementById("propostaMensal");
    var myLineChart = new Chart(ctx, {
        type: 'line',
        data: {
            labels: dias,
            datasets: [{
                label: "Propostas",
                lineTension: 0.3,
                backgroundColor: "rgba(2,117,216,0.2)",
                borderColor: "rgba(2,117,216,1)",
                pointRadius: 5,
                pointBackgroundColor: "rgba(2,117,216,1)",
                pointBorderColor: "rgba(255,255,255,0.8)",
                pointHoverRadius: 5,
                pointHoverBackgroundColor: "rgba(2,117,216,1)",
                pointHitRadius: 50,
                pointBorderWidth: 2,
                data: quantidade,
            }],
        },
        options: {
            scales: {
                xAxes: [{
                    time: {
                        unit: 'date'
                    },
                    gridLines: {
                        display: false
                    },
                    ticks: {
                        maxTicksLimit: 7
                    }
                }],
                yAxes: [{
                    ticks: {
                        min: 0,
                        max: 10,
                        maxTicksLimit: 5
                    },
                    gridLines: {
                        color: "rgba(0, 0, 0, .125)",
                    }
                }],
            },
            legend: {
                display: false
            }
        }
    });

    var ctx = document.getElementById("propostaAnual");
    var myLineChart = new Chart(ctx, {
    type: 'bar',
    data: {
        labels: meses,
        datasets: [{
        label: "Propostas",
        backgroundColor: "rgba(2,117,216,1)",
        borderColor: "rgba(2,117,216,1)",
        data: quantidadeMensal,
        }],
    },
    options: {
        scales: {
        xAxes: [{
            time: {
            unit: 'month'
            },
            gridLines: {
            display: false
            },
            ticks: {
            maxTicksLimit: 6
            }
        }],
        yAxes: [{
            ticks: {
            min: 0,
            max: 10,
            maxTicksLimit: 5
            },
            gridLines: {
            display: true
            }
        }],
        },
        legend: {
        display: false
        }
    }
    });
}

// Area Chart Example

