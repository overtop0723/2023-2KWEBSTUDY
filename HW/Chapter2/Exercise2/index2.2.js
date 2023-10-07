const fs = require('fs');
const path = require('path');

const currentDirectory = __dirname;
const treeFolderPath = path.join(currentDirectory, 'test');

function findJSFiles(directory) {
  
    fs.readdir(directory, (err, files) => {
    
        if (err) {
        console.error('Directory not found', err);
        return;
        }

        files.forEach(file => {
      
            const filePath = path.join(directory, file);

            fs.stat(filePath, (err, stats) => {
                if (err) {
                console.error('File not found', err);
                return;
                }

                if (stats.isDirectory()) {
                findJSFiles(filePath);
                }
                
                else {
                    if (path.extname(filePath) === '.js') {
                        console.log(filePath);
                    }
                }
            });
        });
    });
}

findJSFiles(treeFolderPath);