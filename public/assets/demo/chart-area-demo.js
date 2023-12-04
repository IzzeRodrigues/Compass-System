// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#292b2c';


const date = new Date();

var dia = date.getDate();

var dias = [];
var quantidadeProposta = [];

for (i = 0; i < dia; i++)
{
    dias.push(`Dezembro ${i+1}`);
    fetch(`http://localhost:8000/puxandoPropostaData?DIA=${i+1}`)
    .then((response) => response.json())
    .then((json) => colocandoQuantidade(json))
}

function colocandoQuantidade(valor)
{
    quantidadeProposta.push(valor);
    console.log(quantidadeProposta);
}

// Area Chart Example
var ctx = document.getElementById("myAreaChart");   
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
            data: [quantidadeProposta],
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
