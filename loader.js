var m3u8ToMp4 = require("m3u8-to-mp4");
var converter = new m3u8ToMp4();

var args = process.argv.slice(2);
if (args.length < 2) {
  console.log('Error: missing parameters. \n\nUsage:\n  hls2mp4 [m3u8 url] [mp4 file name]');
  process.exit();
}

var m3u8File = args[0];
var mp4File = `share/${args[1]}`;

(async function() {
  await converter
    .setInputFile(m3u8File)
    .setOutputFile(mp4File)
    .start();

  console.log(`File[${mp4File}] converted!`);
})();