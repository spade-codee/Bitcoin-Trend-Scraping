% Example: Fetch Bitcoin price using an API
url = 'https://api.coindesk.com/v1/bpi/currentprice.json';
data = webread(url);
bitcoinPrice = data.bpi.USD.rate_float;
fprintf('Current Bitcoin Price: $%.2f\n', bitcoinPrice);
prices = [45000, 45500, 46000, 47000, 46500, 48000, 47500];
days = {'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'};
plot(prices, '-o');
title('Bitcoin Price Trend');
xlabel('Day');
ylabel('Price (USD)');
xticks(1:7);
xticklabels(days);
grid on;

% Create a report
rpt = Report('Crypto_Report','pdf');
titlePage = TitlePage;
titlePage.Title = 'Cryptocurrency Price Report';
titlePage.Author = 'Dear Spade';
add(rpt, titlePage);

add(rpt, Paragraph('This is an automated report for cryptocurrency prices.'));
add(rpt, Paragraph(['Bitcoin Price: $', num2str(bitcoinPrice)]));

% Add a chart
img = 'crypto_price_chart.png'; % Save the chart as an image
saveas(gcf, img);
add(rpt, Image(img));

% Close and view the report
close(rpt);
rptview(rpt);

