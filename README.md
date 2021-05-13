
fix error: Webpacker can't find application.js in /mnt/d/cuoi_ky_chuyende/public/packs/manifest.json. 

solution: chạy 3 câu lệnh ở phía dưới

*  yarn remove @rails/webpacker
  
*  rm -rf ./node_modules
  
*  yarn add @rails/webpacker@^5.2.1
