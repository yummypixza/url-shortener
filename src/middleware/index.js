// eslint-disable-next-line no-unused-vars
module.exports = function (app) {
  app.get('/:url', async (req, res) => {
    console.log('req.params.url', req.params.url);
    const urlService = req.app.service('/api/url');
    const accessLogService = req.app.service('/api/access_log');
    const URLItemList = await urlService.find({query: {shortened_url: req.params.url}, paginate: false});
    if(URLItemList.length > 0){
      const URLItem = URLItemList[0];
      const ip = req.headers['x-forwarded-for'] || req.connection.remoteAddress;
      await accessLogService.create({
        url_id: URLItem.url_id,
        source_ip: ip
      });
      return res.redirect(URLItem.original_url);
    }
    else
      return res.status(404).json({error: 'Not found'});
  });

  app.get('/', (req, res) => {
    res.redirect(301, '/public/index.html');
  });
};
