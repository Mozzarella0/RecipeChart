import route from 'riot-route';
import './tag/core/footer.tag';
import './tag/core/header.tag';
import './tag/app.tag';

riot.mount('*');
route.base('/');
route.start(true);
