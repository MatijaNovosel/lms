import axios from 'axios';
import { Routing } from '@/constants/Routing';
import jwt_decode from 'jwt-decode';
import NotificationService from '../notification';

export default {
  async login(model) {
    return await axios.post(`${Routing.baseRoute}auth/login`, {
      Username: model.Username,
      Password: model.Password
    });
  },
  async register(model) {
   return await axios.post(`${Routing.baseRoute}auth/register`, {
      Username: model.Username,
      Password: model.Password
    }).catch(error => {
      console.log(error);
      NotificationService.error(`${error.name}: ${error.message}`, 'Unable to register!');
    });
  },
  loggedIn() {
    const token = localStorage.getItem('token');
    const decoded = jwt_decode(token);
    const exp = decoded.exp * 1000; // Expires at (EXP)
    if(new Date().getTime() > exp) {
      return false;
    }
    return true;
  },
  logout() {
    localStorage.removeItem('token');
    localStorage.removeItem('user');
  }
}