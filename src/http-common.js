import axios from 'axios';

const API_SERVER = axios.create({
  baseURL: process.env.VUE_APP_API_BASE_URL,
  headers: {}
})

export default API_SERVER