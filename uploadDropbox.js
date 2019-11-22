const fse = require('fs-extra');
const dropboxV2Api = require('dropbox-v2-api');
const dropbox = dropboxV2Api.authenticate({ token: process.env.DROPBOX_TOKEN });
const mode = (!!process.env.MODE) ? process.env.MODE : 'dev';

(() => {
    console.log(`upload file to ${mode}/intelligent-data-hub-linux`);
    // overwrite seems not to work for binaries, thus the file will be deleted before upload
    dropbox({
        resource: 'files/delete',
        parameters: {
            'path': `/${mode}/intelligent-data-hub-linux`
        }
    }, (err, result, response) => {
        console.log('delete dropbox file: ', result);

        dropbox({
            resource: 'files/upload',
            parameters: {
                'path': `/${mode}/intelligent-data-hub-linux`,
                'mode': 'overwrite',
                'autorename': false,
                'mute': false,
                'strict_conflict': false
            },
            readStream: fse.createReadStream(`${__dirname}/dist/pkg/intelligent-data-hub-linux`)
            // readStream: fse.createReadStream(`docker/${mode === 'prod' ? '_production' : '_development'}/core/no_cache.txt`)
        }, (err, result, response) => {
            if (!!err) {
                console.error(JSON.stringify(err));
            } else {
                console.log('upload dropbox file: ', result);
            }
        });
    });
})();
